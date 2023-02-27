class PageModel {
  ///当前页数
  int curPage = 0;

  ///数据
  List datas = [];

  ///偏移
  int offset = 0;

  ///是否为最后一页
  bool over = false;

  ///页数长度
  int pageCount = 0;

  ///当前页大小
  int size = 0;

  ///数据总大小
  int total = 0;

  PageModel({
    required this.curPage,
    required this.datas,
    required this.offset,
    required this.over,
    required this.pageCount,
    required this.size,
    required this.total,
  });

  PageModel.fromJson(Map<dynamic, dynamic> json) {
    curPage = json["curPage"];
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
    datas = json['datas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["curPage"] = curPage;
    data["datas"] = datas;
    data["offset"] = offset;
    data["over"] = over;
    data["pageCount"] = pageCount;
    data["size"] = size;
    data["total"] = total;
    return data;
  }
}