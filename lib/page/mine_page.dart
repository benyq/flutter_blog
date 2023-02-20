import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_blog/page/login/login_page.dart';
import 'package:flutter_blog/widget/style.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    //不设置这个，内部的Image无法设置大小
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 6)
                        ]),
                    child: ClipOval(
                        child: Image.asset(
                      "assets/images/ic_complex.png",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Benyq",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
                const DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Colors.grey),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16, right: 8, top: 5, bottom: 5),
                    child: Icon(AntIcons.setting),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Flex(
                direction: Axis.horizontal,
                children: const [
                  Expanded(
                    child: ScoreWidget("收藏", "1"),
                    flex: 2,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: ScoreWidget("分享", "2"),
                    flex: 2,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: ScoreWidget("积分", "3"),
                    flex: 2,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    child: ScoreWidget("历史", "4"),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  FunctionItem(AntIcons.person, "个人信息", () {
                    debugPrint("1");
                  }),
                  FunctionItem(AntIcons.about, "关于", () {
                    debugPrint("2");
                  }),
                  FunctionItem(AntIcons.share, "分享", () {
                    debugPrint("3");
                  }),
                  FunctionItem(AntIcons.feedBack, "反馈", () {
                    debugPrint("4");
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FunctionItem extends StatelessWidget {
  const FunctionItem(this.iconData, this.title, this.f, {super.key});

  final IconData iconData;
  final String title;
  final VoidCallback? f;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        f?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: [
            Icon(iconData),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(title),
              ),
            ),
            const Icon(AntIcons.rightArrow),
          ],
        ),
      ),
    );
  }
}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(this.title, this.score, {super.key});

  final String score;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(score,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(
          height: 10,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 12,
            )),
      ],
    );
  }
}
