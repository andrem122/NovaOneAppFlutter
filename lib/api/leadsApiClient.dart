import 'dart:convert';
import 'package:http/http.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/novaOneUrl.dart';

class LeadsApiClient extends BaseApiClient {
  LeadsApiClient({required Client client, required UserStore userStore})
      : super(client: client, userStore: userStore);

  /// Gets the user's most recent leads from the Novaone API
  ///
  /// Returns an [ApiMessageException] object if the request fails
  /// and leads data if the request was successful
  Future<List<Lead>> getRecentLeads() async {
    final User user = await userStore.getUser();

    Map<String, String> parameters = {
      'email': user.email,
      'password': await userStore
          .getPassword(), // Have to use userStore.getPassword here because the user object has an encryptyed password
      'customerUserId': user.id.toString(),
    };
    final response = await postToNovaOneApi(
        uri: NovaOneUrl.novaOneApiLeadsData,
        parameters: parameters,
        errorMessage: 'Could not fetch leads data');

    final List<dynamic> json = jsonDecode(response.body);
    return json.map((leadJson) => Lead.fromJson(json: leadJson)).toList();
  }
}
