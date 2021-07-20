import 'dart:convert';

import 'package:flutter_bili_app/http/request/base_request.dart';

class MiResponse<T> {
  T? data;
  BaseRequest? request;
  int? statusCode;
  String? message;
  dynamic extra;

  MiResponse(
      {this.data, this.request, this.statusCode, this.message, this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    } else {
      return data.toString();
    }
  }
}
