import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

/// The model to handle error messages from the API
///
/// The [reason] indicates why the request failed with an [error] code

@JsonSerializable()
class ApiMessageException {
  final String reason;
  final int error;

  const ApiMessageException({@required this.reason, @required this.error});

  factory ApiMessageException.fromJson({@required Map<String, dynamic> json}) {
    assert(json != null);
    return ApiMessageException(
      error: json['error'],
      reason: json['reason'],
    );
  }
}

class ApiMessageFailureHandler {
  /// Returns the error message from the API request if it fails
  ///
  /// Takes in a [fallback] message if the error response cannot be parsed as json
  static ApiMessageException getErrorMessage(
      {@required String fallback, @required http.Response response}) {
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return ApiMessageException.fromJson(json: json);
    } on Exception {
      // Unable to parse json error response so use the fallback response
      return ApiMessageException(reason: fallback, error: 0);
    }
  }
}
