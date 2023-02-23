import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_blog/utils/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_info.dart';

class SPUtil {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void write(String key, dynamic data) async {
    if (data is int) {
      _prefs.setInt(key, data);
    } else if (data is bool) {
      _prefs.setBool(key, data);
    } else if (data is double) {
      _prefs.setDouble(key, data);
    } else if (data is String) {
      _prefs.setString(key, data);
    } else if (data is List<String>) {
      _prefs.setStringList(key, data);
    }
  }

  static String? read(String key) {
    return _prefs.getString(key);
  }

  static putUserInfo(UserInfo user) {
    write(SPKey.userInfo, jsonEncode(user.toJson()));
  }

  static UserInfo? getUserInfo() {
    try {
      String? json = read(SPKey.userInfo);
      if (json == null) {
        return null;
      } else {
        return UserInfo.fromJson(jsonDecode(json));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
