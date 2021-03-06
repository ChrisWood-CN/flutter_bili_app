import 'package:flutter_bili_app/http/core/mi_net.dart';
import 'package:flutter_bili_app/http/request/notice_request.dart';
import 'package:flutter_bili_app/model/notice_mo.dart';

///通知列表Dao
class NoticeDao {
  //https://api.devio.org/uapi/fa/notice?pageIndex=1&pageSize=10
  static noticeList({int pageIndex = 1, int pageSize = 10}) async {
    NoticeRequest request = NoticeRequest();
    request.addParams({"pageIndex": pageIndex, "pageSize": pageSize});
    var result = await MiNet.getInstance().fire(request);
    print("notice_dao_result:${result.toString()}");
    return NoticeMo.fromJson(result['data']);
  }
}
