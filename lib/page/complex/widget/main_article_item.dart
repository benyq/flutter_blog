import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainArticleItem extends StatelessWidget {

  int index = 0;
  Function(int)? tapAction;

  MainArticleItem({Key? key, required this.index, this.tapAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text.rich(
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                TextSpan(children: [
                  WidgetSpan(
                      child: Visibility(
                          visible: index <= 2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.red),
                            margin: const EdgeInsets.only(right: 3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            child: const Text(
                              "荐",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ))),
                  TextSpan(
                    text: "电子烟新规发布，为什么电子烟必须含有烟碱？电子烟新规发布，为什么电子烟必须含有烟碱？",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  )
                ])),
            Padding(padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text("热门专题", style: TextStyle(color: Colors.orange.shade600),),
                  const SizedBox(width: 10,),
                  const Text("|"),
                  const SizedBox(width: 10,),
                  Text("张鸿洋", style: TextStyle(color: Colors.grey.shade600),),
                  const SizedBox(width: 10,),
                  Text("一天前", style: TextStyle(color: Colors.grey.shade600),),
                ],
              ),)
          ],
        ),
      ),
      onTap: () {
        tapAction?.call(index);
      },
    );
  }
}
