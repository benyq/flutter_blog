
import 'package:flutter/cupertino.dart';

class QuestionAnswerPage extends StatefulWidget {
  const QuestionAnswerPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionAnswerPageState();

}


class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("QuestionAnswerPage"),
          ],
        )
      ],
    );
  }

}