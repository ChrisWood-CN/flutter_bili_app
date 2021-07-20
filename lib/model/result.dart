class Result {
  //定义字段
  int code;
  String method;
  String requestPrams;

  Result(this.code, this.method, this.requestPrams);

  //固定格式，不同的类使用不同的mixin即可
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      json['code'] as int,
      json['method'] as String,
      json['requestPrams'] as String,
    );
  }

  //固定格式，
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': this.code,
        'method': this.method,
        'requestPrams': this.requestPrams,
      };
}
