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

  factory ApiMessageException.fromJson(Map<String, dynamic> json) {
    return ApiMessageException(
      error: json['error'],
      reason: json['reason'],
    );
  }
}

class ApiMessageFailureHandler {
  static throwMessage(
      {@required String fallback, @required http.Response response}) {
    try {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      throw ApiMessageException.fromJson(json);
    } on Exception {
      throw fallback;
    }
  }
}
