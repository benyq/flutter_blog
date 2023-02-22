
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/page/article_page.dart';
import 'package:flutter_blog/page/complex/widget/main_article_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(height: 200, width: double.infinity, child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://via.placeholder.com/288x188",
                  fit: BoxFit.fill,
                ),),onTap: (){},);
            },
            itemCount: 10,
            scale: 0.75,
            pagination: const SwiperPagination(),
            autoplay: true,
          ),);
        }
        return MainArticleItem(index: index - 1, tapAction: (itemIndex) {
          ArticlePage.toArticle(context);
        });
      }, itemCount: 20, physics: const BouncingScrollPhysics(),),
    );
  }

}