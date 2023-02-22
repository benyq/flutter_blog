import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/common_app_bar.dart';
import '../widget/style.dart';

class ArticlePage extends StatefulWidget {
  static void toArticle(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ArticlePage();
    }));
  }

  const ArticlePage({super.key});

  @override
  State<StatefulWidget> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late WebViewController _webviewController;
  String articleTitle = "";

  @override
  void initState() {
    super.initState();
    _webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.baidu.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: commonAppBar(
            title: Text(articleTitle),
            actions: [
              UnconstrainedBox(
                child: SizedBox.square(
                    dimension: 40,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: shareArticle,
                      child: const Icon(Icons.share),
                    )),
              ),
              Box.hBox6
            ],
          ),
          body: WebViewWidget(controller: _webviewController),
        ),
        onWillPop: () => _exitPage(context));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _exitPage(BuildContext context) async {
    if (await _webviewController.canGoBack()) {
      _webviewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  void shareArticle() {}
}
