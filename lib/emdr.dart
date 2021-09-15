import 'dart:async';
import 'dart:io';

import 'package:emdr_web/circleanimation.dart';
import 'package:emdr_web/emdrbottom.dart';
import 'package:emdr_web/infinity.dart';
import 'package:emdr_web/music.dart';
import 'package:emdr_web/page_manager.dart';
import 'package:emdr_web/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wakelock/wakelock.dart';

import 'line.dart';
import 'main.dart';

var xMax = 0.0;
Color color = Color(0xFFba343c);
int time = 700;
Widget ballWidget = Container();
double top = 170;
double ballSize = 40;
bool musicStart = false;

class EMDR extends StatefulWidget {
  const EMDR({Key? key}) : super(key: key);

  @override
  _EMDRState createState() => _EMDRState();
}

class _EMDRState extends State<EMDR>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  final picker = ImagePicker();
  int active = 2;
  int colorAct = 0;
  bool fullScreen = false;
  int topSize = 5;
  int bottomSize = 5;
  bool _start = false;
  bool fStart = false;
  double emdrWidth = 600;
  bool vi = true;
  Color borderColor = Colors.white;
  late PageManager pageManager;

  List<Color> boxColor = [
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4)
  ];
  List<Color> modeBoxColor = [
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
    Color(0xFF9ea1b4),
  ];
  List<Color> colorBorder = [
    Color(0xFFba343c),
    Color(0XFFba853c),
    Color(0XFFb8b23b),
    Color(0XFF54b23b),
    Color(0XFF5886ba),
    Color(0XFF4d4863),
    Color(0XFF8c6ba1),
  ];

  IconData screen = FontAwesomeIcons.expand;
  bool speedCheck = false;
  bool zeroCheck = false;
  late Widget paint;
  BoxFit boxFit = BoxFit.fill;
  double ix = 1;
  double iy = 1;
  double x = 1;
  double y = 1;
  int mode = 0;
  double circleRadius = 20;
  @override
  void initState() {
    pageManager = PageManager();
    color = Color(0xFFba343c);
    time = 700;
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.paused) {
      print("applifecycle paused");
      pageManager.pause();
    } else if (state == AppLifecycleState.resumed) {
      if (musicStart) pageManager.play();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    //removeImage();
    //removeBall();

    pageManager.dispose();
    WidgetsBinding.instance!.removeObserver(this);

    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    if (fullScreen) {
      if (fStart) {
        time += 500;
        _start = !_start;
        fStart = false;
      }
      boxFit = BoxFit.fitHeight;

      borderColor = Color(0x66999999);
      vi = false;
      top = MediaQuery.of(context).size.height / 2 - 30;
      if (top > 240) {
        ballSize = 40;
        xMax = MediaQuery.of(context).size.width - 70;
      } else {
        ballSize = top / 6;
        xMax = MediaQuery.of(context).size.width - 60;
      }
    } else {
      if (fStart) {
        time -= 500;
        _start = !_start;
        fStart = false;
        if (_start) {
          isPlaying = true;
          icon = Icons.pause;
        }
      }
      boxFit = BoxFit.fill;

      borderColor = Colors.white;
      vi = true;
      top = MediaQuery.of(context).size.height / 4 - 30;
      ballSize = top / 6;
      xMax = MediaQuery.of(context).size.width - 60;
    }

    if (MediaQuery.of(context).size.width > 600) {
      emdrWidth = 600;
    } else {
      emdrWidth = MediaQuery.of(context).size.width;
    }

    boxColor = [
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4)
    ];
    modeBoxColor = [
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
      Color(0xFF9ea1b4),
    ];
    colorBorder = [
      Color(0xFFba343c),
      Color(0XFFba853c),
      Color(0XFFb8b23b),
      Color(0XFF54b23b),
      Color(0XFF5886ba),
      Color(0XFF4d4863),
      Color(0XFF8c6ba1),
    ];
    colorBorder[colorAct] = Colors.white;
    modeBoxColor[mode] = Color(0xFF26283a);
    boxColor[active] = Color(0xFF26283a);
    circleRadius = ballSize * 0.75;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: time),
    );
    modeCheck();
    _animationController.forward();
    _animationController.repeat(reverse: true);

    return Scaffold(
      backgroundColor: Color(0xFF213C4D),
      //endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: (fullScreen) ? FileImage(File("")) : image,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              fit: (fullScreen) ? BoxFit.none : BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: topSize,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: (fullScreen)
                            ? Color(0x66999999)
                            : Color(0x00000000),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onPanStart: (detail) {
                                  ix = detail.globalPosition.dx;
                                  iy = detail.globalPosition.dy;
                                },
                                onPanUpdate: (detail) {
                                  setState(() {
                                    if (fullScreen) {
                                      x = (detail.globalPosition.dx - ix) / 100;
                                      y = (detail.globalPosition.dy - iy) / 60;
                                    } else {
                                      x = (detail.globalPosition.dx - ix) / 40;
                                      y = (detail.globalPosition.dy - iy) / 60;
                                    }
                                  });
                                },
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          alignment: Alignment(-x, -y),
                                          image: (fullScreen)
                                              ? image
                                              : FileImage(File("")),
                                          colorFilter: new ColorFilter.mode(
                                              Colors.black.withOpacity(0.6),
                                              BlendMode.dstATop),
                                          fit: (fullScreen)
                                              ? BoxFit.cover
                                              : BoxFit.none,
                                        ),
                                        color: (fullScreen)
                                            ? Colors.white30
                                            : Color(0x00000000)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          paint,
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  modeChange();
                                  setState(() {
                                    if (fullScreen) {
                                      fullScreen = false;
                                      topSize = 5;
                                      bottomSize = 5;
                                      screen = FontAwesomeIcons.expand;
                                      _start = !_start;
                                      fStart = true;
                                      Wakelock.disable();
                                    } else {
                                      fullScreen = true;
                                      topSize = 10;
                                      bottomSize = 0;
                                      screen = FontAwesomeIcons.compress;
                                      _start = !_start;
                                      fStart = true;
                                      Wakelock.enable();
                                    }
                                  });
                                },
                                icon: Icon(
                                  screen,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: vi,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Container(width: emdrWidth, child: EMDRControl()),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget stateWindow(Widget ch) {
  //   Widget result;
  //   if (MediaQuery.of(context).size.width > 600) {
  //     result = Row(
  //       children: [
  //         Expanded(child: Container()),
  //         Container(
  //           width: 600,
  //           child: ch,
  //         ),
  //         Expanded(child: Container()),
  //       ],
  //     );
  //   } else {
  //     result = Expanded(
  //       flex: bottomSize,
  //       child: ch,
  //     );
  //   }
  //   return result;
  // }

  void modeCheck() {
    if (_start) {
      if (mode == 0) {
        //paint = _buildImage();
        if (speedCheck) {
          Future.delayed(const Duration(milliseconds: 1), () {
            setState(() {
              mode++;
              speedCheck = false;
            });
          });
        }
        paint = Line();
      } else if (mode == 1) {
        if (zeroCheck) {
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() {
              mode--;
              zeroCheck = false;
            });
          });
        }
        if (speedCheck) {
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() {
              mode++;
              speedCheck = false;
            });
          });
        }
        paint = SampleAnimation();
      } else if (mode == 2) {
        if (speedCheck) {
          Future.delayed(const Duration(milliseconds: 10), () {
            setState(() {
              mode++;
              speedCheck = false;
            });
          });
        }
        paint = CircleAnimation();
      } else if (mode == 3) {
        paint = Infinity();
      }
    } else {
      paint = Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: top,
              left: MediaQuery.of(context).size.width / 2 - ballSize,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(30),
                ),
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

  void _update(bool ch) {
    setState(() => _start = !_start);
  }

  // ignore: non_constant_identifier_names
  Container EMDRControl() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0x88999999)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                EMDRBottom(
                  update: _update,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxColor[0],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              "S1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () {
                            speedChange(2000, 0);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxColor[1],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              "S2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () {
                            speedChange(1400, 1);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxColor[2],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              "S3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () {
                            speedChange(700, 2);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxColor[3],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              "S4",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () {
                            speedChange(500, 3);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: boxColor[4],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: Text(
                              "S5",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onTap: () {
                            speedChange(300, 4);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                color: modeBoxColor[0],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 30,
                              width: 35,
                              alignment: Alignment.center,
                              child: Icon(
                                CupertinoIcons.resize_h,
                                color: Colors.white,
                              )),
                          onTap: () {
                            if (_start) {
                              setState(() {
                                mode = 0;
                              });
                            }
                          },
                        ),
                        VerticalDivider(
                          color: Colors.white12,
                          width: 5,
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: modeBoxColor[1],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 35,
                            alignment: Alignment.center,
                            child: ImageIcon(
                              AssetImage("assets/u.png"),
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            if (_start) {
                              setState(() {
                                mode = 1;
                              });
                            }
                          },
                        ),
                        VerticalDivider(
                          color: Colors.white12,
                          width: 5,
                        ),
                        GestureDetector(
                          child: Container(
                              decoration: BoxDecoration(
                                color: modeBoxColor[2],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 30,
                              width: 35,
                              alignment: Alignment.center,
                              child: Icon(
                                CupertinoIcons.circle,
                                color: Colors.white,
                              )),
                          onTap: () {
                            if (_start) {
                              setState(() {
                                mode = 2;
                              });
                            }
                          },
                        ),
                        VerticalDivider(
                          color: Colors.white10,
                          width: 5,
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: modeBoxColor[3],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 30,
                            width: 35,
                            alignment: Alignment.center,
                            child: Icon(
                              CupertinoIcons.infinite,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            if (_start) {
                              setState(() {
                                mode = 3;
                              });
                            }
                          },
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Colors.white10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0xFFba343c), 0);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFba343c),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[0],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFFba853c), 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFba853c),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[1],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFFb8b23b), 2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFFb8b23b),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[2],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFF54b23b), 3);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFF54b23b),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[3],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFF5886ba), 4);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFF5886ba),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[4],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFF4d4863), 5);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFF4d4863),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[5],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                    GestureDetector(
                      onTap: () {
                        colorChange(Color(0XFF8c6ba1), 6);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0XFF8c6ba1),
                            borderRadius: BorderRadius.circular(circleRadius),
                            border: Border.all(
                              color: colorBorder[6],
                            )),
                        height: circleRadius,
                        width: circleRadius,
                      ),
                    ),
                    VerticalDivider(),
                  ],
                ),
                Divider(
                  color: Colors.white12,
                ),
                GestureDetector(
                  onTap: () {
                    Get.defaultDialog(
                        title: "이미지 선택",
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: RaisedButton(
                                onPressed: getImage,
                                child: Text("배경 이미지"),
                              ),
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                onPressed: getBall,
                                child: Text("볼 이미지"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                onPressed: removeImage,
                                child: Text("배경 이미지 삭제"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                onPressed: removeBall,
                                child: Text("볼 이미지 삭제"),
                              ),
                            ),
                          ],
                        ),
                        textCancel: "닫기",
                        buttonColor: Colors.white,
                        cancelTextColor: Colors.black);
                  },
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.camera_fill,
                        color: Colors.white54,
                        size: 25,
                      ),
                      VerticalDivider(
                        color: Colors.white12,
                        width: 10,
                      ),
                      Text(
                        "배경과 볼을 원하는 이미지로 업로드 할 수 있습니다.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white70,
                  height: 15,
                ),
                Music(
                  pageManager: pageManager,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //}
  }

  void colorChange(Color _color, int act) {
    if (_start) {
      setState(() {
        color = _color;
        colorAct = act;

        removeBall();
      });
    }
  }

  void speedChange(int _time, int _active) {
    if (_start) {
      modeChange();
      setState(() {
        time = _time;
        active = _active;
      });
    }
  }

  void modeChange() {
    if (mode > 0) {
      mode--;
      speedCheck = true;
    } else {
      mode++;
      zeroCheck = true;
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print(pickedFile);
      setState(() {
        image = NetworkImage(pickedFile.path);
      });
      //await File(pickedFile.path).copy('$path/background.png');
    } else {
      print('No image selected.');
    }
  }

  Future getBall() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        ball = NetworkImage(pickedFile.path);
        ballWidget = CircleAvatar(
          radius: 25,
          backgroundColor: color,
          backgroundImage: ball,
        );
      } else {
        print('No image selected.');
      }
    });
  }

  removeBall() {
    setState(() {
      ballWidget = Container();
    });
  }

  removeImage() {
    if (mounted) {
      setState(() {
        image = AssetImage("assets/background.png");
      });
    }
  }
}
