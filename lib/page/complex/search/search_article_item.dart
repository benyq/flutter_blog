import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchArticleItem extends StatelessWidget {
  int index = 0;
  Function(int)? tapAction;

  SearchArticleItem({Key? key, required this.index, this.tapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              "电子烟新规发布，为什么电子烟必须含有烟碱？电子烟新规发布，为什么电子烟必须含有烟碱？",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "热门专题",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("|"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "张鸿洋",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "一天前",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        tapAction?.call(index);
      },
    );
  }
}
