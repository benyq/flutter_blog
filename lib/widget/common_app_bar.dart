import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar commonAppBar({
  Widget? title,
  List<Widget>? actions,
  IconThemeData iconTheme = const IconThemeData(color: Colors.black),
  TextStyle titleTextStyle = const TextStyle(color: Colors.black, fontSize: 20),
  Color backgroundColor = const Color(0xFFEDEDED),
}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEDEDED),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
    title: title,
    actions: actions,
    iconTheme: iconTheme,
    titleTextStyle: titleTextStyle,
    backgroundColor: const Color(0xFFEDEDED),
    shadowColor: Colors.transparent,
  );
}
