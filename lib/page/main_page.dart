import 'package:flutter/material.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'mine/mine_page.dart';
import 'project/project_page.dart';
import 'complex/complex_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),//这里是你期望的颜色
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [ComplexPage(), ProjectPage(), MinePage()],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              offset: Offset(0.0, 15.0), //阴影xy轴偏移量
              blurRadius: 15.0, //阴影模糊程度
              spreadRadius: 1.0 //阴影扩散程度
              )
        ]),
        height: 65,
        child: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: [
            _TabTitleIcon(title: "综合", icon: AntIcons.complex),
            _TabTitleIcon(title: "项目", icon: AntIcons.project),
            _TabTitleIcon(title: "我的", icon: AntIcons.mine),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

class _TabTitleIcon extends StatelessWidget {
  String title = "";
  IconData icon;

  _TabTitleIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      iconMargin: const EdgeInsets.all(4),
      icon: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
