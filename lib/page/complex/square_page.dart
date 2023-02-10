
import 'package:flutter/cupertino.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({super.key});

  @override
  State<StatefulWidget> createState() => _SquarePageState();

}


class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("SquarePage"),
          ],
        )
      ],
    );
  }

}