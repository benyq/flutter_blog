import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_blog/widget/style.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(child: _ProjectItem(), onTap: (){},);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
          );
        },
        itemCount: 5);
  }
}

class _ProjectItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    "一个强大的 Gradle Plugin，可以帮助你演示你的 Android Demo 应用",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Box.vBox10,
                  Text(
                    "生活已经很艰难，老项目均需 Java 维护，但如果追求 “数据一致性” 使用 final，那么激增这么多样板代码，反而容易滋生更多一致性问题，所以，Java 想在代码安全和简便之间取得平衡，该怎么办？ Java-8-Sealed-Class 应运而生。",
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Box.vBox10,
                  Row(
                    children: [
                      Icon(AntIcons.postAuthor),
                      Box.hBox3,
                      Text(
                        "AndroidBBQ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  Box.vBox10,
                  Row(
                    children: [
                      Icon(AntIcons.postTime),
                      Box.hBox3,
                      Text(
                        "2023/02/20 16:01",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://www.wanandroid.com/blogimgs/72def908-f8a1-40ba-9e8d-aff8625ef478.png",
              width: 90,
              height: 160,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
