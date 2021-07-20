import 'package:flutter_bili_app/http/core/dio_adapter.dart';
import 'package:flutter_bili_app/http/core/mi_adapter.dart';
import 'package:flutter_bili_app/http/core/mi_error.dart';
import 'package:flutter_bili_app/http/core/mi_response.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

class MiNet {
  MiNet._();

  static MiNet? _instance;

  static MiNet getInstance() {
    if (_instance == null) {
      _instance = MiNet._();
    }
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    MiResponse? response;
    var error;
    try {
      response = await send(request);
    } on MiError catch (e) {
      error = e;
    } catch (e) {
      error = e;
    }
    if (response == null) {
      print("mi_net:$error");
    }
    var result = response?.data;
    var statusCode = response?.statusCode ?? -1;
    switch (statusCode) {
      case 200:
        return result;
      case 401:
        throw NeedLogin(data: result);
      case 403:
        throw NeedAuth(result.toString(), data: result);
      default:
        throw MiError(statusCode, result.toString(), data: result);
    }
  }

  Future<MiResponse> send<T>(BaseRequest request) async {
    MiAdapter adapter = DioAdapter();
    return await adapter.send(request);
  }
}
