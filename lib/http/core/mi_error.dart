/// 异常统一类
class MiError implements Exception {
  late int code;
  late String message;
  dynamic data;

  MiError(this.code, this.message, {this.data});
}

class NeedAuth extends MiError {
  NeedAuth(String message, {code: 403, dynamic data})
      : super(code, message, data: data);
}

class NeedLogin extends MiError {
  NeedLogin({code: 401, message: "请先登录", dynamic data})
      : super(code, message, data: data);
}
