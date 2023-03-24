import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/page/article_page.dart';
import 'package:flutter_blog/widget/style.dart';

class AboutAppPage extends StatelessWidget {
  late TapGestureRecognizer _gestureRecognizer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEDEDED),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: const Color(0xFFEDEDED),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Box.hBoxMax,
          CachedNetworkImage(
            imageUrl: "https://www.wanandroid.com/resources/image/pc/logo.png",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Flutter Blog",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text.rich(
                style: const TextStyle(fontSize: 16),
                TextSpan(children: [
                  const TextSpan(
                    text:
                        "这是一个使用flutter开发的 WanAndroid App，主要是学习flutter的练手项目。",
                  ),
                  TextSpan(
                      text: "项目地址",
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        ArticlePage.toArticle(context, "project github", "https://github.com/benyq/flutter_blog.git");
                      }),
                ])),
          ),
        ],
      ),
    );
  }
}
