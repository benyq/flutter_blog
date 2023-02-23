import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog/AntIcons.dart';
import 'package:flutter_blog/model/user_info.dart';
import 'package:flutter_blog/utils/sp_util.dart';
import 'package:flutter_blog/utils/system_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFEDEDED),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('登录'),
        actions: [
          SizedBox(
              width: 50,
              child: InkWell(
                onTap: _alertDialog,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("注册",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ))
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: const Color(0xFFEDEDED),
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
            padding: const EdgeInsets.only(top: 40),
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

    if (uname.isEmpty) {
      showToast("用户名不能为空");
      return;
    }

    if (pwd.isEmpty) {
      showToast("密码不能为空");
      return;
    }

    debugPrint("uname:$uname, pwd: $pwd");

    var repository = RequestRepository();
    repository.login(uname, pwd, success: (data) {
      var user = UserInfo.fromJson(data);
      SPUtil.putUserInfo(user);
      showToast("登录成功");
      Navigator.pop(context, user);
    }, fail: (code, msg) {
      showToast("登录失败，错误: $msg");
    });
  }

  _alertDialog() async {
    var alertDialogs = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("懒得做了，去WanAndroid网站上注册吧，哥们"),
            actions: <Widget>[
              ElevatedButton(
                  child: const Text("好吧，懒鬼!"),
                  onPressed: () => Navigator.pop(context, "yes")),
            ],
          );
        });
    return alertDialogs;
  }


}
