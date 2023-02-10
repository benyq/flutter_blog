import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/http/request.dart';
import 'package:flutter_blog/page/complex/home_page.dart';
import 'package:flutter_blog/page/complex/question_answer_page.dart';
import 'package:flutter_blog/page/complex/square_page.dart';

class ComplexPage extends StatefulWidget {
  const ComplexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ComplexPageState();
}

class _ComplexPageState extends State<ComplexPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin  {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(),
                labelColor: Colors.blue,
                labelStyle: const TextStyle(fontSize: 22),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                tabs: const [
                  Text("首页"),
                  Text("广场"),
                  Text("文档"),
                ],
              ),
            ),
            const Expanded(flex:1, child: SizedBox.shrink()),
            Expanded(flex:1, child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)))
          ],
        ),
        Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              children: const [
                HomePage(), SquarePage(), QuestionAnswerPage()
              ],
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class _TabBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
