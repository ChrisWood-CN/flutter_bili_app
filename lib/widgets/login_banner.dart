import 'package:flutter/material.dart';
import 'package:flutter_bili_app/utils/color.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';

class LoginBanner extends StatefulWidget {
  final bool protect;

  const LoginBanner({Key? key, this.protect = false}) : super(key: key);

  @override
  _LoginBannerState createState() => _LoginBannerState();
}

class _LoginBannerState extends State<LoginBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.rpx),
      decoration: BoxDecoration(
          color: primary[50],
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(true),
          Image(
              height: 180.rpx,
              width: 180.rpx,
              image: AssetImage('images/logo.png')),
          _image(false),
        ],
      ),
    );
  }

  _image(bool left) {
    var name = left ? '_left' : '_right';
    var protectStr = widget.protect ? "_protect" : "";
    return Image(
        height: 180.rpx,
        width: 180.rpx,
        image: AssetImage('images/head$name$protectStr.png'));
  }
}
