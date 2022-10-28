import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAExersiceScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppCommon.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MADataProvider.dart';

class MASelectSceneScreen extends StatefulWidget {
  final String? heroTag;
  final String? meditationName;
  final String? bgImg;

  MASelectSceneScreen({this.heroTag,this.meditationName, this.bgImg});

  @override
  MASelectSceneScreenState createState() => MASelectSceneScreenState();
}

class MASelectSceneScreenState extends State<MASelectSceneScreen> {
  int? currentIndex = 0;
  PageController? pageController;
  double viewportFraction = 0.8;
  double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Hero(
              tag: widget.heroTag!,
              child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.bgImg!), fit: BoxFit.cover, opacity: 0.5), color: Colors.black),
                height: context.height(),
                width: context.width(),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView.builder(
                  itemCount: musicFeaturedList.length,
                  controller: pageController,
                  itemBuilder: (context, i) {
                    double scale = max(viewportFraction, (1 - (pageOffset! - i).abs() + viewportFraction));
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      padding: EdgeInsets.only(
                        right: 30,
                        top: 100 - scale * 25,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: boxDecorationWithRoundedCorners(decorationImage: DecorationImage(image: AssetImage(widget.bgImg!), fit: BoxFit.cover)),
                          ),
                          GestureDetector(
                            onTap: () {
                              MAExerciseScreen(
                                exerciseGif: "images/meditationApp/buddha_gif.gif",
                                exerciseTitle: "Breath",
                                exerciseMsg: "Take a deep breath & Relax",
                                doExercise: false,
                              ).launch(context);
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.asset(musicFeaturedList[i].img.toString(), height: MediaQuery.of(context).size.height * 0.5),
                                playButton(enableBg: true)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  onPageChanged: (int i) {
                    currentIndex = i;
                    setState(() {});
                  },
                ),
              ).center(),
            ],
          ),
          Positioned(
            top: context.statusBarHeight + 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.width,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: backButton(context,enableBg: true)
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.meditationName!, style: boldTextStyle(color: Colors.white, size: 24)),
                    4.height,
                    Text('Meditation', style: secondaryTextStyle(color: Colors.white.withOpacity(0.5))),
                  ],
                ),
                16.width,
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Swipe for more', style: secondaryTextStyle(color: Colors.white)),
                dotIndicator(musicFeaturedList, currentIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
