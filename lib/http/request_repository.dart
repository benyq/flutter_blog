import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/http/request.dart';
import 'package:flutter_blog/http/request_api.dart';

class RequestRepository {
  login(
    String account,
    String password, {
    Success? success,
    Fail? fail,
  }) {
    var formData = FormData.fromMap({
      'username': account,
      'password': password,
    });

    Request.post(RequestApi.login, formData, success: success, fail: fail);
  }

  banner() {
    Request.get(RequestApi.banner, {}, success: (res) {
      debugPrint("$res");
    });
  }
}
