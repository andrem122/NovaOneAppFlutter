import 'package:novaone/api/api.dart';
import 'package:novaone/apiCredentials.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:novaone/novaOneUrl.dart';

class BaseApiClient {
  final Client client;

  final Map<String, String> baseParameters = {
    'PHPAuthenticationUsername': ApiCredentials.PHPAuthenticationUsername,
    'PHPAuthenticationPassword': ApiCredentials.PHPAuthenticationPassword,
  };

  BaseApiClient({@required this.client}) : assert(client != null);

  /// Makes a post request with some base parameters to the NovaOneApi
  ///
  /// Takes in some extra [paramaters] to add to the [baseParameters]
  /// Also requries a [uri] to make a request to
  Future<Response> postToNovaOneApi(
      {@required Uri uri,
      @required Map<String, dynamic> parameters,
      String errorMessage = 'Unsuccessful request!'}) async {
    // Add the base parameters to the additional parameters
    parameters.addAll(baseParameters);
    final Response response = await client.post(uri,
        headers: NovaOneUrl.apiHeaders, body: parameters);

    // Handle errors
    if (response.statusCode != 200) {
      ApiMessageFailureHandler.throwMessage(
          fallback: errorMessage, response: response);
    }

    return response;
  }
}
