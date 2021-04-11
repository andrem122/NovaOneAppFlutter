import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/novaOneUrl.dart';

class UserApiClient extends BaseApiClient {
  final Client client;

  UserApiClient({@required this.client}) : super(client: client);

  /// Gets the user object from the API by sending a [username] and [password]
  /// to the NovOne Api
  ///
  /// Returns an [ApiMessageException] object if the request fails
  /// and a [User] object if the request was successful
  Future<User> getUser(
      {@required String username, @required String password}) async {
    Map<String, String> parameters = {'email': username, 'password': password};

    final response = await postToNovaOneApi(
        uri: NovaOneUrl.novaOneApiUrlLogin,
        parameters: parameters,
        errorMessage: 'Could not fetch user data');

    final Map<String, dynamic> json = jsonDecode(response.body);
    return User.fromJson(json: json);
  }
}
