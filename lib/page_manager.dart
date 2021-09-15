import 'package:emdr_web/music.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';

class PageManager {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioPlayer;

  PageManager() {
    init();
  }

  next() async {
    await _audioPlayer.seekToNext();
  }

  prev() async {
    await _audioPlayer.seekToPrevious();
  }

  playList(int index) async {
    await _audioPlayer.seek(Duration.zero, index: index);
  }

  void init() async {
    // initialize the song
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/A Spirit Level.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Beach Walking.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Bright day.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Butterfly Traces.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Calm Ambient Nature.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Day of Mine.mp3")),
          AudioSource.uri(
              Uri.parse("http://jdskuhost.cafe24.com/emdrMusic/Dear Mama.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Field Of Flowers.mp3")),
          AudioSource.uri(
              Uri.parse("http://jdskuhost.cafe24.com/emdrMusic/Goxo.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Imaginary Waterfalls.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Inner Reflection.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Love You For It All.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Meditation.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Melancholic piano with rain and thunder.mp3")),
          AudioSource.uri(
              Uri.parse("http://jdskuhost.cafe24.com/emdrMusic/Morning.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Morning Light.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Nature_s Wonders.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/NeverEnding.mp3")),
          AudioSource.uri(
              Uri.parse("http://jdskuhost.cafe24.com/emdrMusic/Pines.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Quebec-Mornings.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Soft Dreamy.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Sweet Home.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Walking Away.mp3")),
          AudioSource.uri(Uri.parse(
              "http://jdskuhost.cafe24.com/emdrMusic/Yoga Spirit.mp3")),
        ],
      ),
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    _audioPlayer.setLoopMode(LoopMode.all);

    // listen for changes in player state
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    // listen for changes in play position
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    // listen for changes in the buffered position
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    // listen for changes in the total audio duration
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void mute() {
    if (_audioPlayer.volume == 0) {
      _audioPlayer.setVolume(100);
      volume = Icon(
        FontAwesomeIcons.volumeUp,
        color: Colors.white,
      );
    } else {
      _audioPlayer.setVolume(0);
      volume = Icon(
        FontAwesomeIcons.volumeMute,
        color: Colors.white,
      );
    }
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
