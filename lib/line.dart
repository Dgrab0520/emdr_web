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
  double cxMax = xMax;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: cTime));
    _tween = Tween(begin: 0.0, end: cxMax);
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
    return curved();
  }

  Container curved() {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: top,
            left: _animation.value,
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
