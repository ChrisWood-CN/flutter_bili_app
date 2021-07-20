import 'package:flutter/material.dart';
import 'package:flutter_bili_app/pages/register_page.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';
import 'package:flutter_bili_app/widgets/app_bar.dart';
import 'package:flutter_bili_app/widgets/login_banner.dart';
import 'package:flutter_bili_app/widgets/login_button.dart';
import 'package:flutter_bili_app/widgets/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("登录", "注册", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RegisterPage()));
      }),
      body: ListView(
        children: [
          LoginBanner(
            protect: protect,
          ),
          LoginInput(
            title: "用户名",
            hint: "请输入用户名",
            onChanged: (v) {
              userName = v;
            },
          ),
          LoginInput(
            title: "密码",
            hint: "请输入密码",
            obscureText: true,
            onChanged: (v) {
              userName = v;
            },
            focusChanged: (focus) {
              this.setState(() {
                protect = focus;
              });
            },
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 40.rpx, right: 40.rpx, top: 40.rpx),
              child: LoginButton(
                '登录',
                enable: loginEnable,
                onPressed: send,
              ))
        ],
      ),
    );
  }

  void send() {}
}
