import 'dart:convert';

import 'package:flutter_bili_app/http/core/mi_adapter.dart';
import 'package:flutter_bili_app/http/core/mi_error.dart';
import 'package:flutter_bili_app/http/core/mi_response.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';
import 'package:http/http.dart' as http;

class HttpAdapter extends MiAdapter {
  @override
  Future<MiResponse> send<T>(BaseRequest request) async {
    var url = Uri.parse(request.url()), response, error;
    Map<String, String> headers = Map();
    if (request.headers.length > 0) {
      request.headers.forEach((key, value) {
        headers[key] = value.toString();
      });
    }
    try {
      if (request.method() == HttpMethod.GET) {
        response = await http.get(url, headers: headers);
      } else if (request.method() == HttpMethod.POST) {
        response = await http.post(url, headers: headers, body: request.params);
      } else if (request.method() == HttpMethod.DELETE) {
        response =
            await http.delete(url, headers: headers, body: request.params);
      }
    } catch (e) {
      error = e;
    }
    if (response.statusCode == 200) {
      return buildResponse(response, request);
    } else {
      throw MiError(response?.statusCode ?? -1, error.toString(),
          data: buildResponse(response, request));
    }
  }

  buildResponse(response, BaseRequest request) {
    Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
    var body = json.decode(utf8decoder.convert(response.bodyBytes));
    print(body);
    return MiResponse(
        data: body,
        statusCode: response.statusCode,
        message: response.reasonPhrase,
        request: request,
        extra: response);
  }
}
