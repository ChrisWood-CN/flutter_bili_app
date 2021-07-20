import 'package:flutter_bili_app/db/mi_cache_1.dart';
import 'package:flutter_bili_app/http/core/mi_net.dart';
import 'package:flutter_bili_app/http/request/login_request.dart';
import 'package:flutter_bili_app/http/request/register_request.dart';

class LoginDao {
  static const BOARDING_PASS = "boarding-pass";

  static getBoardingPass() {
    return MiCache.getInstance().get(BOARDING_PASS);
  }

  static login(String userName, String password) {
    return _send(userName, password);
  }

  static register(
      String userName, String password, String imoocId, String orderId) {
    return _send(userName, password);
  }

  static _send(String userName, String password,
      {String? imoocId, String? orderId}) async {
    var result;
    if (imoocId != null && orderId != null) {
      result = MiNet.getInstance().fire(RegisterRequest().addParams({
        "userName": userName,
        "password": password,
        "imoocId": imoocId,
        "orderId": orderId
      }));
    } else {
      result = MiNet.getInstance().fire(LoginRequest().addParams({
        "userName": userName,
        "password": password,
      }));
    }
    print("login_dao_result:${result.toString()}");
    if (result['code'] == 0 && result['data'] != null) {
      //保存登录令牌
      MiCache.getInstance().setString(BOARDING_PASS, result['data']);
    }
    return result;
  }
}
