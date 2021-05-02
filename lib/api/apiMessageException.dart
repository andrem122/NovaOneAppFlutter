import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

/// The model to handle error messages from the API
///
/// The [reason] indicates why the request failed with an [error] code

@JsonSerializable()
class ApiMessageException implements Exception {
  final String? reason;
  final int? error;

  const ApiMessageException({required this.reason, required this.error});

  factory ApiMessageException.fromJson({required Map<String, dynamic> json}) {
    return ApiMessageException(
      error: json['error'],
      reason: json['reason'],
    );
  }
}

class ApiMessageFailureHandler {
  /// Throws the error message from the API request if it fails
  ///
  /// Takes in a [fallback] message if the error response cannot be parsed as json
  static ApiMessageException throwErrorMessage(
      {required String fallback, required http.Response response}) {
    ApiMessageException exception;
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      exception = ApiMessageException.fromJson(json: json);
    } on Exception {
      // Unable to parse json error response so use the fallback response
      exception = ApiMessageException(reason: fallback, error: 0);
    }

    throw exception;
  }
}
