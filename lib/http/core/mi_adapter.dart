import 'package:flutter_bili_app/http/core/mi_response.dart';
import 'package:flutter_bili_app/http/request/base_request.dart';

abstract class MiAdapter {
  Future<MiResponse> send<T>(BaseRequest request);
}
