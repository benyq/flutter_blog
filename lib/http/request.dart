import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/http/dio_http.dart';

typedef Success<T> = void Function(T data);
typedef Fail = void Function(int code, String msg);

class Request {
  static final DioHttp _dioHttp = DioHttp();

  static get(
    String path,
    Map<String, dynamic>? queryParameters, {
    Success? success,
    Fail? fail,
  }) {
    return _request(path, HttpMethod.get, queryParameters: queryParameters,
        success: (res) {
      debugPrint("success: $res");
      success?.call(res['data']);
    }, fail: (int code, String msg) {
      debugPrint("fail: $code, $msg");
      fail?.call(code, msg);
    });
  }

  static post(
    String path,
    dynamic data, {
    Success? success,
    Fail? fail,
  }) {
    return _request(path, HttpMethod.post, data: data, success: (res) {
      debugPrint("success: $res");
      success?.call(res['data']);
    }, fail: (int code, String msg) {
      debugPrint("fail: $code, $msg");
      fail?.call(code, msg);
    });
  }

  static Future _request(String path, HttpMethod method,
      {Map<String, dynamic>? queryParameters,
      dynamic data,
      Success? success,
      Fail? fail}) async {
    var result = await _dioHttp.request(path, method,
        queryParameters: queryParameters, data: data);

    var errorCode = result.data?['errorCode'];

    if (result.code != 0) {
      fail?.call(result.code, result.msg);
    } else if (errorCode != 0) {
      var errorMsg = result.data?['errorMsg'];
      fail?.call(errorCode, errorMsg);
    } else {
      success?.call(result.data);
    }
  }
}
