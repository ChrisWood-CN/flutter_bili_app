import 'package:flutter/material.dart';
import 'package:flutter_bili_app/utils/color.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginButton(this.title, {Key? key, this.enable = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.rpx)),
        height: 90.rpx,
        onPressed: enable ? onPressed : null,
        disabledColor: Colors.grey[400],
        color: primary,
        child: Text(title,
            style: TextStyle(color: Colors.white, fontSize: 32.rpx)),
      ),
    );
  }
}
