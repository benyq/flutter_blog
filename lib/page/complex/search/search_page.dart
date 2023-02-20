import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/page/complex/search/search_article_item.dart';
import 'package:flutter_blog/widget/style.dart';

import '../../../AntIcons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  bool _isShowClose = false;
  bool _isShowSearchRecord = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        var text = _controller.text;
        setState(() {
          _isShowClose = text.isNotEmpty;
          _isShowSearchRecord = text.isEmpty;
        });
      });
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
                  visible: _isShowSearchRecord,
                  child: Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // 搜索历史
                        Box.vBox15,
                        Row(
                          children: [
                            const Expanded(
                                child: Text(
                              "搜索历史",
                              style: TextStyle(fontSize: 16),
                            )),
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
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
                            children: [
                              Chip(
                                label: Text('Mulligan'),
                              ),
                              Chip(
                                label: Text('Laurens'),
                              ),
                            ],
                          ),
                        ),
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
                                return InkWell(child: hotSearch(index, "2222"), onTap: (){},);
                              },
                              itemCount: 9,
                            )),
                      ],
                    ),
                  )),
              //搜索结果列表
              Visibility(
                  visible: !_isShowSearchRecord,
                  child: Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SearchArticleItem(
                          index: index,
                          tapAction: (index) {},
                        );
                      },
                      itemCount: 5,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _searchContent() {
    var content = _controller.text;
    debugPrint("searchContent: $content");
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
