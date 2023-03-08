import 'package:dio/dio.dart';
import 'package:flutter_blog/http/request.dart';
import 'package:flutter_blog/http/request_api.dart';
import 'package:flutter_blog/model/article_model.dart';
import 'package:flutter_blog/model/page_model.dart';
import 'package:flutter_blog/model/project_category.dart';

import '../model/banners.dart';
import '../model/project_model.dart';
import '../model/user_info.dart';

typedef SuccessOver<T> = Function(T data, bool over);

class RequestRepository {
  login(
    String account,
    String password, {
    Success<UserInfo>? success,
    Fail? fail,
  }) {
    var formData = FormData.fromMap({
      'username': account,
      'password': password,
    });

    Request.post<dynamic>(RequestApi.login, formData, success: (data) {
      var user = UserInfo.fromJson(data);
      success?.call(user);
    }, fail: fail);
  }

  banner({Success<List<Banners>>? success, Fail? fail}) {
    Request.get<dynamic>(RequestApi.banner, {}, success: (data) {
      List<Banners> banners = data.map<Banners>((value) {
        return Banners.fromJson(value);
      }).toList();
      success?.call(banners);
    }, fail: fail);
  }

  homeArticle(int page, {SuccessOver<List<ArticleModel>>? success, Fail? fail}) {
    var path = RequestApi.homeArticle.replaceAll('{page}', '$page');
    Request.get<dynamic>(path, null, success: (data) {
      PageModel pageData = PageModel.fromJson(data);
      List<ArticleModel> articles = pageData.datas.map((value) {
        return ArticleModel.fromJson(value);
      }).toList();
      success?.call(articles, pageData.over);
    }, fail: fail);
  }

  projectCategory({Success<List<ProjectCategory>>? success, Fail? fail}) {
    Request.get<dynamic>(RequestApi.projectCategory, {}, success: (data){
      List<ProjectCategory> projectCategories = data.map<ProjectCategory>((value) {
        return ProjectCategory.fromJson(value);
      }).toList();
      success?.call(projectCategories);
    }, fail: fail);
  }

  projects(int page, int cid, {SuccessOver<List<ProjectModel>>? success, Fail? fail}) {
    var path = RequestApi.project.replaceAll('{page}', '$page');
    Request.get<dynamic>(path, {
      'cid': cid
    }, success: (data) {
      PageModel pageData = PageModel.fromJson(data);
      List<ProjectModel> projects = pageData.datas.map((value) {
        return ProjectModel.fromJson(value);
      }).toList();
      success?.call(projects, pageData.over);
    }, fail: fail);
  }
}
