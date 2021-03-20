import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/novaOneUrl.dart';

class UserApiClient extends BaseApiClient {
  final Client client;

  UserApiClient({@required this.client}) : super(client: client);

  /// Gets the user object from the API by sending a [email] and [password]
  Future<User> getUser(
      {@required String email, @required String password}) async {
    Map<String, String> parameters = {'email': email, 'password': password};
    final response = postToNovaOneApi(
        uri: NovaOneUrl.novaOneApiUrlLogin, parameters: parameters);
  }
}
