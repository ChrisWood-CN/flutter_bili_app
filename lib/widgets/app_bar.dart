import 'package:flutter/material.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';

appBar(String tittle, String rightTitle, VoidCallback rightButtonClick) {
  return AppBar(
    centerTitle: false,
    titleSpacing: 0,
    leading: BackButton(),
    title: Text(
      tittle,
      style: TextStyle(fontSize: 36.rpx),
    ),
    actions: [
      InkWell(
        onTap: rightButtonClick,
        child: Container(
          padding: EdgeInsets.only(left: 30.rpx, right: 30.rpx),
          alignment: Alignment.center,
          child: Text(
            rightTitle,
            style: TextStyle(fontSize: 36.rpx, color: Colors.black54),
          ),
        ),
      )
    ],
  );
}
