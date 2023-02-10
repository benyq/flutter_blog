import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/AntIcons.dart';

import '../../http/request_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  bool pwdShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
        actions: [
          SizedBox(
              width: 50,
              child: InkWell(
                onTap: () {},
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "注册",
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _unameController,
            autofocus: true,
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
                prefixIcon: Icon(AntIcons.person)),
          ),
          TextField(
            controller: _pwdController,
            autofocus: true,
            obscureText: !pwdShow,
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(pwdShow ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      pwdShow = !pwdShow;
                    });
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  _login();
                },
                child: const Text("登录")),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _unameController.dispose();
    _pwdController.dispose();
  }


  Future _login() async {
    var uname = _unameController.text;
    var pwd = _pwdController.text;

    debugPrint("uname:$uname, pwd: $pwd");

    var repository = RequestRepository();
    repository.login("yzjbenyq", "yezijian520");
  }
}
