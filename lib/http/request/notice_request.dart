import 'package:flutter_bili_app/http/request/base_request.dart';

class NoticeRequest extends BaseRequest {
  @override
  bool needLogin() {
    return true;
  }

  @override
  String path() {
    return '/uapi/notice';
  }

  @override
  HttpMethod method() {
    return HttpMethod.GET;
  }
}
