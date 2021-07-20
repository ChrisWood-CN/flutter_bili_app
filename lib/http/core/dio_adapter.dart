import 'package:dio/dio.dart';
import 'package:flutter_bili_app/http/core/mi_adapter.dart';
import 'package:flutter_bili_app/http/core/mi_error.dart';
import 'package:flutter_bili_app/http/core/mi_response.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

class DioAdapter extends MiAdapter {
  @override
  Future<MiResponse> send<T>(BaseRequest request) async {
    var error,
        response,
        options = BaseOptions(headers: request.headers),
        method = request.method();
    Dio dio = Dio(options);
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            request.url(),
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(request.url(), data: request.params);
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(request.url(), data: request.params);
          break;
      }
    } on DioError catch (e) {
      error = e;
      response = e.response;
    } catch (e) {
      error = e;
    }
    if (error != null) {
      throw MiError(response?.statusCode ?? -1, error.toString(),
          data: buildResponse(response, request));
    }
    return buildResponse(response, request);
  }

  buildResponse(Response response, BaseRequest request) {
    return MiResponse(
        data: response.data,
        statusCode: response.statusCode,
        message: response.statusMessage,
        request: request,
        extra: response.extra);
  }
}
