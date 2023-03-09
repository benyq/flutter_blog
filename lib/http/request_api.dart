class RequestApi {
  ///前缀地址
  static const String baseurl = 'https://www.wanandroid.com';

  static const String login = '$baseurl/user/login';

  static const String banner = '$baseurl/banner/json';

  static const String homeArticle = '$baseurl/article/list/{page}/json';

  static const String projectCategory = '$baseurl/project/tree/json';

  static const String project = '$baseurl/project/list/{page}/json';

  static const String hotKey = '$baseurl/hotkey/json';

  static const String search = '$baseurl/article/query/{page}/json';

}