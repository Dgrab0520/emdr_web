import 'package:emdr_web/music.dart';
import 'package:emdr_web/page_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'emdr.dart';
import 'main.dart';

class Brain extends StatefulWidget {
  const Brain({Key? key}) : super(key: key);

  @override
  _BrainState createState() => _BrainState();
}

class _BrainState extends State<Brain>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool fullScreen = false;
  int topSize = 5;
  int bottomSize = 5;
  double emdrWidth = 600;
  var _icon = Icons.play_arrow;
  late PageManager pageManager;
  bool vi = true;
  bool _start = false;
  final picker = ImagePicker();
  double ix = 1;
  double iy = 1;
  double x = 1;
  double y = 1;

  play() {
    setState(() {
      if (_start) {
        _icon = Icons.play_arrow;
        content = Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "- 눈은 뇌의 거울이고 뇌와 연결되어 있습니다.\n\n"
              "- 정상적인 눈의 운동성을 회복하고 자율신경계를 자극하며\n뇌의 기능 저하를 방지하며 증가시키는\n비약물 섭취 운동입니다."
              "\n\n- 근육의 수축이 지속되면 혈관의 과도한 수축도 유지되며\n뇌 피공급은 감소되고 혈액순환의 불균형과\n뇌재활, 뇌건강을 방해합니다."
              "\n\n- 자율신경, 뇌기능, 소뇌위축증, 어지러움증, 안구안정피로,\n목/어깨 긴장감 등의 좋은 운동입니다."
              "\n\n- 고개는 좌우로 20~30도 정도 돌려주세요.\n40~50도로 고개를 돌리면 Ball을 볼 수 없습니다."
              "\n\n- 고개를 좌우로 너무 빨리 움직이거나,\n정면의 Ball이 흐릿하게 보이거나 어지러우면\n속도를 천천히 하시고 각도를 조금 줄이면서 움직여주세요."
              "\n\n- 화면을 터치하거나 Play 버튼을 클릭하세요.",
              style: TextStyle(
                //fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
        _start = false;
      } else {
        _icon = Icons.pause;

        if (brain == AssetImage('assets/brain_sun.gif')) {
          content = Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white38,
                  image: DecorationImage(image: brain, fit: BoxFit.cover),
                ),
              ),
            ),
          );
        } else {
          content = Padding(
            padding: const EdgeInsets.only(top: 20.0),
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
                  play();
                  play();
                });
              },
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white38,
                    image: DecorationImage(
                        image: brain,
                        alignment: Alignment(-x, -y),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          );
        }

        _start = true;
      }
    });
  }

  Widget content = Padding(
    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        "- 눈은 뇌의 거울이고 뇌와 연결되어 있습니다.\n\n"
        "- 정상적인 눈의 운동성을 회복하고 자율신경계를 자극하며\n뇌의 기능 저하를 방지하며 증가시키는\n비약물 섭취 운동입니다."
        "\n\n- 근육의 수축이 지속되면 혈관의 과도한 수축도 유지되며\n뇌 피공급은 감소되고 혈액순환의 불균형과\n뇌재활, 뇌건강을 방해합니다."
        "\n\n- 자율신경, 뇌기능, 소뇌위축증, 어지러움증, 안구안정피로,\n목/어깨 긴장감 등의 좋은 운동입니다."
        "\n\n- 고개는 좌우로 20~30도 정도 돌려주세요.\n40~50도로 고개를 돌리면 Ball을 볼 수 없습니다."
        "\n\n- 고개를 좌우로 너무 빨리 움직이거나,\n정면의 Ball이 흐릿하게 보이거나 어지러우면\n속도를 천천히 하시고 각도를 조금 줄이면서 움직여주세요."
        "\n\n- 화면을 터치하거나 Play 버튼을 클릭하세요.",
        style: TextStyle(
          //fontSize: fontSize,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );

  IconData screen = FontAwesomeIcons.expand;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    pageManager = PageManager();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      pageManager.pause();
    } else if (state == AppLifecycleState.resumed) {
      if (musicStart) pageManager.play();
    }
  }

  @override
  void dispose() {
    pageManager.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (fullScreen) {
      vi = false;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      vi = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    if (MediaQuery.of(context).size.width > 600) {
      emdrWidth = 600;
    } else {
      emdrWidth = MediaQuery.of(context).size.width;
    }

    return Scaffold(
      backgroundColor: Color(0xFFF4C776),
      //endDrawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
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
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x66999999),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child:
                                  GestureDetector(onTap: play, child: content)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (fullScreen) {
                                      fullScreen = false;
                                      topSize = 5;
                                      bottomSize = 5;
                                      screen = FontAwesomeIcons.expand;
                                    } else {
                                      fullScreen = true;
                                      topSize = 10;
                                      bottomSize = 0;
                                      screen = FontAwesomeIcons.compress;
                                    }
                                  });
                                },
                                icon: Icon(
                                  screen,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: vi,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Container(width: emdrWidth, child: brainControl()),
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

  Container brainControl() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0x88999999)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Brain Exercise",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                IconButton(
                  onPressed: play,
                  icon: Icon(
                    _icon,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                onPressed: getImage,
                                child: Text("이미지"),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                onPressed: removeImage,
                                child: Text("이미지 초기화"),
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
                        "이미지를 원하는 이미지로 업로드 할 수 있습니다.",
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
                SizedBox(
                  height: 5,
                ),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "# 좌우 움직임이 1번입니다. 이것을 20~30번 하루에 여러번 나누어서 실행하세요"
                    "\n# 고개를 좌우로 20~30도 정도 돌리면서 정면의 Ball(타겟)을 응시해야 합니다"
                    "\n# 고개를 좌우로 천천히 움직여주세요.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //}
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        brain = NetworkImage(pickedFile.path);
        play();
        play();
      });
    } else {
      print('No image selected.');
    }
  }

  removeImage() {
    if (mounted) {
      setState(() {
        brain = AssetImage("assets/brain_sun.gif");
        play();
        play();
      });
    }
  }
}
