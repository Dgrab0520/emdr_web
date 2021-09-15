import 'dart:math';

import 'package:flutter/material.dart';

import 'emdr.dart';

class Line extends StatefulWidget {
  const Line({Key? key}) : super(key: key);

  @override
  _LineState createState() => _LineState();
}

class _LineState extends State<Line> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Tween _tween;
  int cTime = time;
  double ballLeft = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: cTime));
    _tween = Tween(begin: 0.0, end: xMax);
    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var r = new Random();
    double d = _animation.value;
    if (d.toInt() == xMax.toInt() && r.nextInt(10) == 1) {
      ballLeft = _animation.value + 3;
    } else {
      ballLeft = _animation.value;
    }
    return curved();
  }

  Container curved() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: top,
            left: ballLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(30)),
              width: ballSize,
              height: ballSize,
              child: FittedBox(
                fit: BoxFit.fill,
                child: ballWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
