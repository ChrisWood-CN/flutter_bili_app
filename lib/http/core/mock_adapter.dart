import 'package:flutter_bili_app/http/core/mi_adapter.dart';
import 'package:flutter_bili_app/http/core/mi_response.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

class MockAdapter extends MiAdapter {
  @override
  Future<MiResponse> send<T>(BaseRequest request) {
    return Future<MiResponse>.delayed(Duration(seconds: 1), () {
      return MiResponse(
          data: {"code": "0", "message": "success"}, statusCode: 200);
    });
  }
}
