import 'package:flutter_bili_app/http/request/base_request.dart';

class RegisterRequest extends BaseRequest {
  @override
  HttpMethod method() {
    return HttpMethod.POST;
  }

  @override
  String path() {
    return "/uapi/user/registration";
  }

  @override
  bool needLogin() {
    return false;
  }
}
