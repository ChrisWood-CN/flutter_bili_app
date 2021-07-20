import 'package:flutter/material.dart';
import 'package:flutter_bili_app/pages/login_page.dart';
import 'package:flutter_bili_app/utils/common.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';
import 'package:flutter_bili_app/widgets/app_bar.dart';
import 'package:flutter_bili_app/widgets/login_banner.dart';
import 'package:flutter_bili_app/widgets/login_button.dart';
import 'package:flutter_bili_app/widgets/login_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;
  String? rePassword;
  String? imoocId;
  String? orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          "注册",
          "登录",
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()))),
      body: Container(
        //自适应键盘弹起，防止遮挡
        child: ListView(
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
              onChanged: (text) {
                password = text;
                checkInput();
              },
              focusChanged: (focus) {
                this.setState(() {
                  protect = focus;
                });
              },
            ),
            LoginInput(
              title: "慕课网ID",
              hint: "请输入你的慕课网用户ID",
              keboardType: TextInputType.number,
              onChanged: (text) {
                imoocId = text;
                checkInput();
              },
            ),
            LoginInput(
              title: "课程订单号",
              hint: "请输入课程订单号后四位",
              keboardType: TextInputType.number,
              onChanged: (text) {
                orderId = text;
                checkInput();
              },
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 40.rpx, right: 40.rpx, top: 40.rpx),
                child: LoginButton(
                  '注册',
                  enable: loginEnable,
                  onPressed: send,
                ))
          ],
        ),
      ),
    );
  }

  void checkInput() {
    bool enable;
    if (isNotEmpty(userName) &&
        isNotEmpty(password) &&
        isNotEmpty(rePassword) &&
        isNotEmpty(imoocId) &&
        isNotEmpty(orderId)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  void send() {}
}
