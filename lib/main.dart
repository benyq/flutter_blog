import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/utils/sp_util.dart';
import 'http/dio_http.dart';
import 'page/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SPUtil.init();
  final DioHttp dioHttp = DioHttp();
  await dioHttp.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEDEDED),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

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
