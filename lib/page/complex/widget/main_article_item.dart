import 'package:flutter_blog/widget/style.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/model/article_model.dart';

class MainArticleItem extends StatelessWidget {
  int index = 0;
  ArticleModel homeArticle;
  Function(int)? tapAction;

  MainArticleItem(
      {Key? key,
      required this.index,
      required this.homeArticle,
      this.tapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ))),
                  TextSpan(
                    text: HtmlUnescape().convert(homeArticle.title),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ])),
            Box.vBox10,
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(constraints: const BoxConstraints(maxWidth: 100)
                  ,child: Text(
                      homeArticle.superChapterName,
                      style: TextStyle(color: Colors.orange.shade600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("|"),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    homeArticle.shareUser.isEmpty
                        ? homeArticle.author
                        : homeArticle.shareUser,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    homeArticle.niceDate,
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
