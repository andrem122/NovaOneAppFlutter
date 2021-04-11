import 'package:novaone/api/api.dart';
import 'package:novaone/apiCredentials.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:novaone/novaOneUrl.dart';

class BaseApiClient {
  final Client client;

  // The base parameters to send with every request to the NovaOne API
  final Map<String, String> baseParameters = {
    'PHPAuthenticationUsername': ApiCredentials.PHPAuthenticationUsername,
    'PHPAuthenticationPassword': ApiCredentials.PHPAuthenticationPassword,
  };

  // The API headers to send with every request to the NovaOne API
  final Map<String, String> apiHeaders = {
    'Referer': NovaOneUrl.novaOneWebsiteUrl.toString(),
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  BaseApiClient({@required this.client}) : assert(client != null);

  /// Makes a post request with some base parameters to the NovaOneApi
  ///
  /// Takes in some extra [parameters] to add to the [baseParameters]
  /// Also requries a [uri] to make a request to
  /// An optional [errorMessage] can be provided for when the request fails
  Future<Response> postToNovaOneApi(
      {@required Uri uri,
      @required Map<String, dynamic> parameters,
      String errorMessage = 'Unsuccessful request!'}) async {
    // Add the base parameters to the additional parameters
    parameters.addAll(baseParameters);

    // Convert to query string
    final String query = Uri(queryParameters: parameters).query;
    final Response response =
        await client.post(uri, headers: apiHeaders, body: query);

    // Handle errors
    if (response.statusCode != 200) {
      ApiMessageFailureHandler.throwErrorMessage(
          fallback: errorMessage, response: response);
    }

    return response;
  }
}
