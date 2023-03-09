import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/http/request_repository.dart';
import 'package:flutter_blog/model/article_model.dart';
import 'package:flutter_blog/model/hot_key.dart';
import 'package:flutter_blog/page/article_page.dart';
import 'package:flutter_blog/page/complex/search/search_article_item.dart';
import 'package:flutter_blog/utils/sp_util.dart';
import 'package:flutter_blog/widget/style.dart';

import '../../../AntIcons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;

  //输入框 删除 按钮
  bool _isShowClose = false;
  //控制显示搜索历史与搜索结果的bool
  bool _isShowSearchHistoryAndHotKey = true;
  bool _isLoading = false;
  late RequestRepository repository;
  List<HotKey> _hotKeys = [];
  List<ArticleModel> _searchArticleResult = [];
  List<String> _searchHistories = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        var text = _controller.text;
        setState(() {
          _isShowClose = text.isNotEmpty;
          if (text.isEmpty) {
            _isShowSearchHistoryAndHotKey = true;
          }
        });
      });

    repository = RequestRepository();
    _hotKey();

    _initSearchRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 搜索框
              Row(
                children: [
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: Icon(
                        AntIcons.leftArrow,
                        size: 25,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Box.hBox6,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      // 让TextField实现上下居中，
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFDDDDDD)),
                      child: Row(
                        children: [
                          Box.hBox6,
                          const Icon(
                            Icons.search,
                            size: 25,
                          ),
                          Box.hBox3,
                          Expanded(
                              child: TextField(
                            controller: _controller,
                            // 让TextField内容实现左右居中，
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintText: "搜索您想要的内容",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF999999)),
                              // contentPadding和border的设置是为了让TextField内容实现上下居中
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          )),
                          Visibility(
                              visible: _isShowClose,
                              child: GestureDetector(
                                onTap: () {
                                  _controller.text = "";
                                },
                                child: const Icon(AntIcons.closeFill),
                              )),
                          Box.hBox6
                        ],
                      ),
                    ),
                  ),
                  Box.hBox6,
                  GestureDetector(
                    onTap: _searchContent,
                    child: const Text(
                      "搜索",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              //搜索记录
              Visibility(
                  visible: _isShowSearchHistoryAndHotKey,
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // 搜索历史
                        Visibility(
                            visible: _searchHistories.isNotEmpty,
                            child: Column(
                              children: [
                                Box.vBox15,
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Text(
                                      "搜索历史",
                                      style: TextStyle(fontSize: 16),
                                    )),
                                    InkWell(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Icon(Icons.delete),
                                      ),
                                      onTap: () {},
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 8.0, // 主轴(水平)方向间距
                                    runSpacing: 4.0, // 纵轴（垂直）方向间距
                                    alignment: WrapAlignment.start, //沿主轴方向居中,
                                    children: _searchHistories.map((e) {
                                      return InkWell(
                                        child: Chip(
                                          label: Text(e),
                                        ),
                                        onTap: () {
                                          _searchContentAuto(e);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )),
                        Box.vBox15,
                        //热搜榜
                        Row(
                          children: const [
                            Text(
                              "热搜榜",
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              AntIcons.hot,
                              color: Color(0xFFF4EA2A),
                            )
                          ],
                        ),
                        Box.vBox15,
                        Expanded(
                            flex: 1,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 3, crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                var hotKey = _hotKeys[index];
                                return InkWell(
                                  child: hotSearch(index + 1, hotKey.name),
                                  onTap: () {
                                    _searchContentAuto(hotKey.name);
                                  },
                                );
                              },
                              itemCount: _hotKeys.length,
                            )),
                      ],
                    ),
                  )),
              //搜索结果列表与loading
              Visibility(
                  visible: !_isShowSearchHistoryAndHotKey,
                  child: Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Colors.grey,
                            );
                          },
                          itemBuilder: (context, index) {
                            var articleModel = _searchArticleResult[index];
                            return SearchArticleItem(
                              articleModel: articleModel,
                              tapAction: () {
                                var title = articleModel.title
                                    .replaceAll('<em class=\'highlight\'>', '');
                                title = title.replaceAll('</em>', '');
                                ArticlePage.toArticle(
                                    context, title, articleModel.link);
                              },
                            );
                          },
                          itemCount: _searchArticleResult.length,
                        ),
                        Visibility(
                            visible: _isLoading,
                            child: const Align(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            )),
                        Visibility(
                          visible: _searchArticleResult.isEmpty && !_isLoading,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("搜索结果为空", style: TextStyle(fontSize: 16),),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

//  点击搜索按钮
  void _searchContent() {
    var content = _controller.text;
    debugPrint("searchContent: $content");

    //开始搜索
    setState(() {
      _isLoading = true;
      _isShowSearchHistoryAndHotKey = false;
      _searchArticleResult = [];
    });
    _searchArticle(content);
    _putSearchRecord(content);
  }

//  点击搜索历史和热搜榜
  void _searchContentAuto(String key) {
    _controller.text = key;
    _controller.selection = TextSelection.fromPosition(
        TextPosition(affinity: TextAffinity.downstream, offset: key.length));

    _searchContent();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _initSearchRecord() {
    var data = SPUtil.getSearchHistory();
    setState(() {
      _searchHistories = data;
    });
  }

  void _putSearchRecord(String key) {
    var set = _searchHistories.toSet();
    set.remove(key);
    var newData = set.toList();
    newData.insert(0, key);
    //判断长度，最多9个
    if (newData.length > 9) {
      newData = newData.sublist(0, 9);
    }
    SPUtil.putSearchHistory(newData);
    setState(() {
      _searchHistories = newData;
    });
  }

  void _hotKey() {
    repository.hotkey(
        success: (data) {
          setState(() {
            data.sort((a, b) => a.order - b.order);
            _hotKeys = data;
          });
        },
        fail: (code, msg) {});
  }

  void _searchArticle(String key) {
    repository.searchArticle(0, key, success: (data, isOver) {
      setState(() {
        _searchArticleResult = data;
        _isLoading = false;
      });
    }, fail: (code, msg) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Widget hotSearch(int index, String data) {
    Color bgColor(int index) {
      if (index == 0) {
        return Colors.red;
      } else if (index == 1) {
        return Colors.orange;
      } else if (index == 2) {
        return Colors.yellow;
      } else {
        return const Color(0xFF999999);
      }
    }

    Color fontColor(int index) {
      if (index < 3) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }

    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bgColor(index)),
          child: Text(
            "$index",
            style: TextStyle(color: fontColor(index)),
          ),
        ),
        Box.hBox3,
        Text(
          data,
          style: const TextStyle(fontSize: 16),
        ),
        if (index < 3)
          const Icon(
            AntIcons.hot,
            color: Colors.red,
          )
      ],
    );
  }
}
