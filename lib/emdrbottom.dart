import 'dart:async';

import 'package:flutter/material.dart';

bool isPlaying = false;
var icon = Icons.play_arrow;

class EMDRBottom extends StatefulWidget {
  final ValueChanged<bool> update;
  EMDRBottom({required this.update});
  @override
  _EMDRBottomState createState() => _EMDRBottomState(update: update);
}

class _EMDRBottomState extends State<EMDRBottom> {
  final ValueChanged<bool> update;
  _EMDRBottomState({required this.update});

  int min = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    if (isPlaying) {
      _start();
    }
  }

  @override
  void dispose() {
    //_timer.cancel();

    isPlaying = false;
    icon = Icons.play_arrow;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Text(
            //   "[EMDR+Video 쿠폰] - ",
            //   style: TextStyle(color: Colors.white),
            // ),
            // Text(
            //   "남은 시간 : $min분",
            //   style:
            //       TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
            // ),
          ],
        ),
        Divider(
          color: Colors.white70,
          height: 10,
        ),
        Row(
          children: [
            Text(
              "EMDR",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            IconButton(
              onPressed: _click,
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Flexible(
                child: Text(
              "[사진이 크면 전체화면에서 사진을 이동할 수 있습니다]",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )),
          ],
        ),
      ],
    );
  }

  void _click() {
    if (min > 0) {
      setState(() {
        update(true);
        isPlaying = !isPlaying;
        if (isPlaying) {
          icon = Icons.pause;
          _start();
        } else {
          icon = Icons.play_arrow;
          _pause();
        }
      });
    }
  }

  void _start() {
    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     if (min > 0) {
    //       //min--;
    //     } else {
    //       setState(() {
    //         //update(false);
    //         //_icon = Icons.play_arrow;
    //         //_pause();
    //       });
    //     }
    //   });
    // });
  }

  void _pause() {
    //_timer.cancel();
  }
}
