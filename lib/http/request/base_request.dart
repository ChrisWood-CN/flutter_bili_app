import 'package:flutter_bili_app/dao/login_dao.dart';

enum HttpMethod { GET, POST, DELETE }

///基础请求
abstract class BaseRequest {
  String? pathParams;
  bool useHttps = true;

  bool needLogin() {
    return true;
  }

  HttpMethod method();

  //域名
  String authority() {
    return 'api.devio.org';
  }

  String path();

  Map<String, dynamic> params = Map();
  Map<String, dynamic> headers = {
    "course-flag": "fa",
    "auth-token": "ZmEtMjAyMS0wNC0xMiAyMToyMjoyMC1mYQ==fa",
  };

  String url() {
    Uri uri;
    var pathStr = path();
    if (pathParams != null) {
      pathStr = pathStr.endsWith('/')
          ? pathStr + pathParams!
          : pathStr + '/' + pathParams!;
    }
    if (useHttps) {
      uri = Uri.https(authority(), pathStr, params);
    } else {
      uri = Uri.http(authority(), pathStr, params);
    }
    if (needLogin()) {
      addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }
    return uri.toString();
  }

  ///建造者模式
  BaseRequest addParam(key, value) {
    params[key] = value;
    return this;
  }

  BaseRequest addParams(Map<String, dynamic> map) {
    params.addAll(map);
    return this;
  }

  BaseRequest addHeader(key, value) {
    headers[key] = value;
    return this;
  }

  BaseRequest addHeaders(Map<String, dynamic> map) {
    params.addAll(map);
    return this;
  }
}
