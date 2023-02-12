import 'package:flutter/material.dart';
import 'http/dio_http.dart';
import 'page/main_page.dart';

void main() async{
  final DioHttp _dioHttp = DioHttp();
  await _dioHttp.init();
  runApp(const MyApp());
  debugPrint("benyq runApp");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
