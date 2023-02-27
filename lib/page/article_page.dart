import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/common_app_bar.dart';
import '../widget/style.dart';

class ArticlePage extends StatefulWidget {
  static void toArticle(BuildContext context, String title, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ArticlePage(title, url);
    }));
  }

  ArticlePage(this.title, this.url, {super.key});

  String title;
  String url;

  @override
  State<StatefulWidget> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late WebViewController _webviewController;

  var _loading = true;
  var _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progress = progress * 1.0 / 100.0;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _loading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: commonAppBar(
            title: Text(widget.title),
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
          body: Stack(
            children: [
              WebViewWidget(controller: _webviewController),
              Visibility(
                  visible: _loading,
                  child: SizedBox(
                    height: 3,
                    width: double.infinity,
                    child: LinearProgressIndicator(
                      value: _progress,
                    ),
                  ))
            ],
          ),
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
