import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/model/article_model.dart';
import 'package:flutter_blog/widget/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

class SearchArticleItem extends StatelessWidget {
  final ArticleModel articleModel;
  final Function? tapAction;
  final HtmlUnescape htmlUnescape = HtmlUnescape();

  SearchArticleItem({Key? key, required this.articleModel, this.tapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = html2Title(articleModel.title);
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(
              data: content,
              style: {
                'font': Style(
                    fontSize: FontSize(16), fontWeight: FontWeight.w700)
              },
            ),
            Box.vBox5,
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Box.hBox6,
                  ConstrainedBox(constraints: const BoxConstraints(maxWidth: 100), child: Text(
                    articleModel.chapterName,
                    style: const TextStyle(color: Colors.black),
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
                    articleModel.shareUser.isEmpty
                        ? articleModel.author
                        : articleModel.shareUser,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    articleModel.niceDate,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        tapAction?.call();
      },
    );
  }

  String html2Title(String html){
    html = html.replaceAll('<em class=\'highlight\'>', '<font color="#f00">');
    html = html.replaceAll('</em>', '</font>');
    html = '<font color="#000">$html</font>';
    debugPrint("content=> $html");
    return html;
  }

}
