/// <BaseRespR<T> 返回 status code msg data Response.
class HttpResult<T> {
  int errorCode;
  String errorMsg;
  T data;

  HttpResult(this.errorCode, this.errorMsg, this.data);

  HttpResult.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMsg = json['errorMsg'],
        data = json['data'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$errorCode");
    sb.write(",\"msg\":\"$errorMsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}