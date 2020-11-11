/// 网络请求结果
class ResultData {
  var data;
  bool success;
  int code;
  var headers;

  ResultData(this.data, this.success, this.code, {this.headers});
}