import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emdr_web/emdr.dart';
import 'package:emdr_web/page_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Icon volume = Icon(
  FontAwesomeIcons.volumeUp,
  color: Colors.white,
);

class Music extends StatefulWidget {
  final pageManager;
  const Music({Key? key, required this.pageManager}) : super(key: key);

  @override
  _MusicState createState() => _MusicState(pageManager);
}

class _MusicState extends State<Music> {
  final pageManager;
  _MusicState(this.pageManager);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("music dispose");
    //pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "재생목록",
                    content: Container(
                      height: 300,
                      width: 300,
                      child: ListView(
                        children: [
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('A Spirit Level'),
                              onTap: () {
                                pageManager.playList(0);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Beach Walking'),
                              onTap: () {
                                pageManager.playList(1);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Bright day'),
                              onTap: () {
                                pageManager.playList(2);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Butterfly Traces'),
                              onTap: () {
                                pageManager.playList(3);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Calm Ambient Nature'),
                              onTap: () {
                                pageManager.playList(4);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Day of Mine'),
                              onTap: () {
                                pageManager.playList(5);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Dear Mama'),
                              onTap: () {
                                pageManager.playList(6);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Field Of Flowers'),
                              onTap: () {
                                pageManager.playList(7);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Goxo'),
                              onTap: () {
                                pageManager.playList(8);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Imaginary Waterfalls'),
                              onTap: () {
                                pageManager.playList(9);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Inner Reflection'),
                              onTap: () {
                                pageManager.playList(10);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Love You For It All'),
                              onTap: () {
                                pageManager.playList(11);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Love You For It All'),
                              onTap: () {
                                pageManager.playList(11);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Love You For It All'),
                              onTap: () {
                                pageManager.playList(11);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Meditation'),
                              onTap: () {
                                pageManager.playList(12);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text(
                                  'Melancholic piano with rain and thunder'),
                              onTap: () {
                                pageManager.playList(13);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Morning'),
                              onTap: () {
                                pageManager.playList(14);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Morning Light'),
                              onTap: () {
                                pageManager.playList(15);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Nature_s Wonders'),
                              onTap: () {
                                pageManager.playList(16);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('NeverEnding'),
                              onTap: () {
                                pageManager.playList(17);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Pines'),
                              onTap: () {
                                pageManager.playList(18);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Quebec-Mornings'),
                              onTap: () {
                                pageManager.playList(19);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Soft Dreamy'),
                              onTap: () {
                                pageManager.playList(20);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Sweet Home'),
                              onTap: () {
                                pageManager.playList(21);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Walking Away'),
                              onTap: () {
                                pageManager.playList(22);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40,
                            alignment: Alignment.center,
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.music_note_2,
                              ),
                              title: const Text('Yoga Spirit'),
                              onTap: () {
                                pageManager.playList(23);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    textCancel: "닫기",
                    buttonColor: Colors.white,
                    cancelTextColor: Colors.black);
              },
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: pageManager.prev,
              icon: Icon(
                FontAwesomeIcons.backward,
                color: Colors.white,
                size: 20,
              ),
            ),
            ValueListenableBuilder<ButtonState>(
              valueListenable: pageManager.buttonNotifier,
              builder: (_, value, __) {
                switch (value) {
                  case ButtonState.loading:
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                      width: 20,
                    );
                  case ButtonState.paused:
                    return IconButton(
                      icon: Icon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        pageManager.play();
                        musicStart = true;
                      },
                    );
                  case ButtonState.playing:
                    return IconButton(
                      icon: Icon(
                        FontAwesomeIcons.pause,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        pageManager.pause();
                        musicStart = false;
                      },
                    );
                }
              },
            ),
            IconButton(
              onPressed: pageManager.next,
              icon: Icon(
                FontAwesomeIcons.forward,
                color: Colors.white,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageManager.mute();
                });
              },
              icon: volume,
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
    );
  }
}
