import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:emdr_web/page_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List<bool> c = [];
  int cNum = 0;
  PageManager pageManager = PageManager();
  List<Widget> list = [];

  List<String> title = [
    "A Spirit Level",
    "Beach Walking",
    "Bright day",
    "Butterfly Traces",
    "Calm Ambient Nature",
    "Day of Mine",
    "Dear Mama",
    "Field Of Flowers",
    "Goxo",
    "Imaginary Waterfalls",
    "Inner Reflection",
    "Love You For It All",
    "Meditation",
    "Melancholic piano with rain and thunder",
    "Morning",
    "Morning Light",
    "Nature_s Wonders",
    "NeverEnding",
    "Pines",
    "Quebec-Mornings",
    "Soft Dreamy",
    "Sweet Home",
    "Walking Away",
    "Yoga Spirit",
  ];

  @override
  void initState() {
    for (int i = 0; i < title.length; i++) {
      c.add(true);
      list.add(Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
        child: Container(
          width: double.infinity,
          child: (c[i])
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.grey,
                  ),
                  onPressed: () {
                    c[cNum] = !c[cNum];
                    setState(() {
                      c[i] = !c[i];
                      cNum = i;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title[i],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.arrowtriangle_right_fill,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    c[cNum] = !c[cNum];
                    setState(() {
                      c[i] = !c[i];
                      cNum = i;
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            title[i],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.arrowtriangle_right_fill,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      ValueListenableBuilder<ProgressBarState>(
                        valueListenable: pageManager.progressNotifier,
                        builder: (_, value, __) {
                          return ProgressBar(
                            timeLabelTextStyle: TextStyle(color: Colors.white),
                            barHeight: 2,
                            baseBarColor: Colors.grey,
                            progressBarColor: Colors.white,
                            thumbColor: Colors.white,
                            thumbGlowColor: Colors.white12,
                            bufferedBarColor: Colors.grey[400],
                            thumbRadius: 8,
                            thumbGlowRadius: 20,
                            progress: value.current,
                            buffered: value.buffered,
                            total: value.total,
                            onSeek: pageManager.seek,
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF213C4D),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FittedBox(
                        child: Text(
                      "Music",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    )),
                  ),
                ),
                Expanded(
                    flex: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x66999999),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView(
                            children: list,
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
