import 'package:flutter/material.dart';
import 'package:flutter_bili_app/utils/color.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';

class LoginInput extends StatefulWidget {
  final String? title;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool lineStreth;
  final bool obscureText;
  final bool isShowLine;
  final TextInputType? keboardType;

  const LoginInput(
      {Key? key,
      this.title,
      this.hint,
      this.onChanged,
      this.focusChanged,
      this.lineStreth = false,
      this.isShowLine = true,
      this.obscureText = false,
      this.keboardType})
      : super(key: key);

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //获取光标监听
    _focusNode.addListener(() {
      print("has focus:${_focusNode.hasFocus}");
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 200.rpx,
              child: Text(
                widget.title ?? '',
                style: TextStyle(fontSize: 30.rpx),
              ),
            ),
            Expanded(
                child: TextField(
              focusNode: _focusNode,
              onChanged: (v) =>
                  {widget.onChanged != null ? widget.onChanged!(v) : null},
              obscureText: widget.obscureText,
              keyboardType: widget.keboardType,
              autofocus: !widget.obscureText,
              cursorColor: primary,
              style: TextStyle(
                  fontSize: 30.rpx,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30.rpx, right: 30.rpx),
                  border: InputBorder.none,
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 30.rpx, color: Colors.grey)),
            ))
          ],
        ),
        _showLine(),
      ],
    );
  }

  _showLine() {
    if (widget.isShowLine) {
      return Padding(
        padding: EdgeInsets.only(
            left: !widget.lineStreth ? 30.rpx : 0,
            right: !widget.lineStreth ? 30.rpx : 0),
        child: Container(
          height: 0,
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(width: 2.rpx, color: Colors.grey))),
        ),
      );
    }
  }
}
