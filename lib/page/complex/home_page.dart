import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/http/request_repository.dart';
import 'package:flutter_blog/model/article_model.dart';
import 'package:flutter_blog/page/article_page.dart';
import 'package:flutter_blog/page/complex/widget/main_article_item.dart';

import '../../model/banners.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = RequestRepository();
  late List<Banners> _bannerList = [];
  late List<ArticleModel> _homeArticles = [];

  int _page = 0;
  bool _isOver = false;

  @override
  void initState() {
    super.initState();

    getBanners();
    getArticleData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  var banner = _bannerList[index];
                  return InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: banner.imagePath,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    onTap: () {
                      ArticlePage.toArticle(context, banner.title, banner.url);
                    },
                  );
                },
                itemCount: _bannerList.length,
                scale: 0.75,
                pagination: const SwiperPagination(),
                autoplay: true,
                duration: 1000,
              ),
            );
          }

          if (index == _homeArticles.length - 3 && !_isOver) {
            _page++;
            getArticleData();
          }

          var homeArticle = _homeArticles[index - 1];
          return MainArticleItem(
              index: index - 1,
              homeArticle: homeArticle,
              tapAction: (itemIndex) {
                ArticlePage.toArticle(
                    context, homeArticle.title, homeArticle.link);
              });
        },
        itemCount: _homeArticles.length + 1,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  void getBanners() {
    repository.banner(
        success: (List<Banners> data) {
          setState(() {
            _bannerList = data;
          });
        },
        fail: (code, msg) {});
  }

  void getArticleData() {
    repository.homeArticle(_page,
        success: (List<ArticleModel> data, bool over) {
      _isOver = over;
      setState(() {
        _homeArticles.addAll(data);
      });
    }, fail: (code, msg) {});
  }
}
