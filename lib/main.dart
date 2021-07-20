import 'package:flutter/material.dart';
import 'package:flutter_bili_app/db/mi_cache.dart';
import 'package:flutter_bili_app/pages/login_page.dart';
import 'package:flutter_bili_app/utils/color.dart';
import 'package:flutter_bili_app/utils/size/size_util.dart';

void main() {
  MiCache.preInit();
  SizeUtil.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: LoginPage(),
    );
  }
}
