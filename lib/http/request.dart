import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/http/dio_http.dart';
import 'package:flutter_blog/model/request_result.dart';

typedef Success<T> = void Function(T data);
typedef Fail = void Function(int code, String msg);

class Request {
  static final DioHttp _dioHttp = DioHttp();

  static get<T>(
    String path,
    Map<String, dynamic>? queryParameters, {
    Success<T>? success,
    Fail? fail,
  }) {
    return _request(path, HttpMethod.get,
        queryParameters: queryParameters, success: success, fail: fail);
  }

  static post<T>(
    String path,
    dynamic data, {
    Success<T>? success,
    Fail? fail,
  }) {
    return _request(path, HttpMethod.post,
        queryData: data, success: success, fail: fail);
  }

  static Future _request<T>(String path, HttpMethod method,
      {Map<String, dynamic>? queryParameters,
      dynamic queryData,
      Success<T>? success,
      Fail? fail}) async {
    await _dioHttp.request(path, method,
        queryParameters: queryParameters, data: queryData, success: (data) {
      var resultModel = HttpResult.fromJson(data);
      if (resultModel.errorCode == 0) {
        success?.call(resultModel.data);
      } else {
        debugPrint(
            "request error =>${resultModel.errorCode}, ${resultModel.errorMsg}");
        fail?.call(resultModel.errorCode, resultModel.errorMsg);
      }
    }, fail: (code, msg) {
      debugPrint("request error =>$code, $msg");
      fail?.call(code, msg);
    });
  }
}
