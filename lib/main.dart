import 'package:emdr_web/temphome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color color = Color(0XFF64B5F6);
ImageProvider image = AssetImage("assets/background.png");
ImageProvider ball = AssetImage("assets/ball.png");
ImageProvider brain = AssetImage("assets/brain_sun.gif");

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool policy = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMDR',
      home: TempHome(),
    );
  }
}
