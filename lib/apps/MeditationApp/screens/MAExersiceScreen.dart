import 'dart:async' as asyn;
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppContants.dart';

class MAExerciseScreen extends StatefulWidget {
  final bool isReadAvailable;
  final String? exerciseGif;
  final String? exerciseTitle;
  final String? exerciseMsg;
  final String? exerciseAudio;
  final bool? doExercise;

  MAExerciseScreen(
      {this.isReadAvailable = false,
      this.exerciseGif,
      this.exerciseTitle,
      this.exerciseMsg,
      this.doExercise = false,
      this.exerciseAudio = MAMeditation_video1});

  @override
  MAExerciseScreenState createState() => MAExerciseScreenState();
}

class MAExerciseScreenState extends State<MAExerciseScreen>
    with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool isTimerActive = true;

  asyn.Timer? timer;
  static const maxseconds = 3;
  int seconds = maxseconds;
  bool visibleTimer = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    if (seconds > 0) {
      timer = asyn.Timer.periodic(Duration(seconds: 3), (timer) {
        setState(() {
          seconds--;
          if (seconds == 0) {
            visibleTimer = false;
            timer.cancel();
            _audioPlayer = AudioPlayer();
            _initAudioPlayer();
            WidgetsBinding.instance.addObserver(this);
            setState(() {});
          }
        });
      });
    } else {
      timer?.cancel();
    }
  }

  _initAudioPlayer() async {
    await _audioPlayer.setAsset(widget.exerciseAudio!);
    _audioPlayer.play();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    Navigator.of(context).pop();
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget timerWidget() {
      return visibleTimer
          ? SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    color: primaryColor,
                    strokeWidth: 12,
                    value: seconds / maxseconds,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Starts in', style: primaryTextStyle()),
                        Text(seconds.toString(),
                            style: boldTextStyle(color: primaryColor))
                      ],
                    ),
                  )
                ],
              ),
            )
          : SizedBox();
    }

    Widget readAndMeditate() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: context.height(),
              width: context.width(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(MABg7),
                      fit: BoxFit.cover,
                      opacity: 0.2),
                  color: Colors.black),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 150, bottom: 16, right: 16, left: 16),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(longDesc + longDesc,
                    textStyle: primaryTextStyle(color: Colors.white, size: 14),
                    curve: Curves.elasticOut,
                    speed: Duration(milliseconds: 100),
                    textAlign: TextAlign.start),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          Positioned(
            top: context.statusBarHeight + 16,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.width,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        backgroundColor: Colors.black45),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back,
                        color: Colors.white.withOpacity(0.8), size: 22),
                  ),
                ),
                16.width,
                Text(widget.exerciseTitle!,
                    style: boldTextStyle(color: Colors.white, size: 24)),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: visibleTimer
          ? timerWidget().center()
          : widget.isReadAvailable
              ? readAndMeditate()
              : widget.doExercise!
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(widget.exerciseGif!,
                                  height: 200.0,
                                  width: 200.0,
                                  fit: BoxFit.cover)
                              .cornerRadiusWithClipRRect(100),
                          16.height,
                          Text(widget.exerciseTitle!, style: boldTextStyle())
                              .paddingSymmetric(horizontal: 16),
                          8.height,
                          Text(widget.exerciseMsg!,
                                  style: secondaryTextStyle(),
                                  textAlign: TextAlign.center)
                              .paddingSymmetric(horizontal: 32),
                        ],
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        widget.exerciseGif!,
                        height: context.height(),
                        width: context.width(),
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(100),
                    ),
    );
  }
}
