import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_blog/page/login/login_page.dart';

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
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const LoginPage();
                  }));
                }, child: Image.asset(
                  "assets/images/ic_complex.png",
                  width: 80,
                ),),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("hello"),
                )),
                const DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      color: Colors.grey),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 8, top: 5, bottom: 5),
                    child: Icon(AntIcons.setting),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: ScoreWidget("收藏", "1"),
                      flex: 1,
                    ),
                    Expanded(
                      child: ScoreWidget("分享", "2"),
                      flex: 1,
                    ),
                    Expanded(
                      child: ScoreWidget("积分", "3"),
                      flex: 1,
                    ),
                    Expanded(
                      child: ScoreWidget("历史", "4"),
                      flex: 1,
                    ),
                  ],
                ),
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(iconData),
            Expanded(
              flex: 1,
              child: Padding(padding: const EdgeInsets.only(left: 10), child: Text(title),),
            ),
            const Icon(AntIcons.rightArrow),
          ],
        ),
      ),
    );
  }

}

class ScoreWidget extends StatelessWidget {
  const ScoreWidget(this.title, this.score, {super.key}) ;

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
        Text(title, style: const TextStyle(fontSize: 12, )),
      ],
    );
  }
}


