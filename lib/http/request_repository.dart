

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/http/request.dart';
import 'package:flutter_blog/http/request_api.dart';

class RequestRepository {


  login(String account, String password) {

    var formData = FormData.fromMap({
      'username':account,
      'password':password,
    });

    Request.post(RequestApi.login, {
      'username':account,
      'password':password,
    }, success: (res){
      debugPrint("success: $res");
    }, fail: (code, msg) {
      debugPrint("fail: $code, $msg");
    });
  }

  
  banner() {
    Request.get(RequestApi.banner, {}, success: (res){
      debugPrint("$res");
    });
  }
}