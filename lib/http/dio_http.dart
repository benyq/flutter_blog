import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/http/request.dart';
import 'package:flutter_blog/http/request_api.dart';
import 'package:flutter_blog/model/user_info.dart';
import 'package:flutter_blog/utils/sp_util.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor.dart';

/// 连接超时时间
const int _connectTimeout = 10000;

/// 接收超时时间
const int _receiveTimeout = 10000;

/// 发送超时时间
const int _sendTimeout = 10000;

class DioHttp {
  // 单例模式使用Http类，
  static final DioHttp _instance = DioHttp._internal();

  factory DioHttp() => _instance;

  static late final Dio dio;

  DioHttp._internal();

  Future init() async {
    /// 初始化dio
    BaseOptions options = BaseOptions(
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        baseUrl: RequestApi.baseurl);

    dio = Dio(options);

    /// 添加各种拦截器
    // var cookieJar = await _cookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true));

    debugPrint("benyq init end");
  }

  Future request(String path, HttpMethod method,
      {dynamic data, //数据
      Map<String, dynamic>? queryParameters,
      Success? success,
      required Fail? fail}) async {
    const Map methodValues = {
      HttpMethod.get: 'get',
      HttpMethod.post: 'post',
      HttpMethod.put: 'put',
      HttpMethod.delete: 'delete',
      HttpMethod.patch: 'patch',
      HttpMethod.head: 'head'
    };

    // //动态添加header头
    // Map<String, dynamic> headers = <String, dynamic>{};
    // headers["version"] = "1.0.0";

    Options options = Options(
      method: methodValues[method],
      headers: _headerToken(),
    );

    try {
      Response response = await dio.request(path,
          data: data, queryParameters: queryParameters, options: options);
      success?.call(response.data);
    } on DioError catch (error) {
      debugPrint("dio request error: ${error.message}");
      HttpException httpException = error.error;
      fail?.call(httpException.code, httpException.msg);
    }
  }

  Future<CookieJar> _cookieJar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    debugPrint("appDocPath: $appDocPath");
    var cookieJar =
        PersistCookieJar(storage: FileStorage("$appDocPath/.cookies/"));
    return Future.value(cookieJar);
  }

  /// 请求时添加cookie
  Map<String, dynamic>? _headerToken() {
    /// 自定义Header,如需要添加token信息请调用此参数
    UserInfo? info = SPUtil.getUserInfo();
    if (info == null) {
      return null;
    }
    Map<String, dynamic> httpHeaders = {
      'Cookie':
          'loginUserName=${info.username};loginUserPassword=${info.password}',
    };
    return httpHeaders;
  }
}

enum HttpMethod {
  get,
  post,
  delete,
  put,
  patch,
  head,
}
