import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAExersiceScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/MaBasicModel.dart';
import 'MAAudioPlayerScreen.dart';

class MAPlayListScreen extends StatefulWidget {
  final String? screenName;
  final List<MABasicModel>? playlist;

  MAPlayListScreen({this.screenName, this.playlist});

  @override
  MAPlayListScreenState createState() => MAPlayListScreenState();
}

class MAPlayListScreenState extends State<MAPlayListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(widget.screenName!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Meditation', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            16.height,
            Column(
              children: List.generate(widget.playlist!.take(2).length, (index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: 200.milliseconds,
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                        decoration: boxDecorationWithShadow(borderRadius: radius(12), blurRadius: 0, backgroundColor: context.cardColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(widget.playlist![index].img!, height: 150, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topLeft: 12, bottomLeft: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(4), backgroundColor: primaryColor),
                                  child: Text('Calm', style: secondaryTextStyle(color: Colors.white)),
                                ),
                                8.height,
                                Text(widget.playlist![index].title!, style: boldTextStyle()),
                                4.height,
                                Text(widget.playlist![index].time! +' • 7 days', style: secondaryTextStyle()),
                                4.height,
                                Text(widget.playlist![index].shortDesc!, style: primaryTextStyle(size: 14), maxLines: 3, overflow: TextOverflow.ellipsis),
                              ],
                            ).paddingAll(8).expand()
                          ],
                        ),
                      ).onTap(() {
                        MAExerciseScreen(
                          isReadAvailable: true,
                          exerciseGif: "Images/buddha_gif.gif",
                          exerciseTitle: "Breath",
                          exerciseMsg: "Take a deep breath & Relax",
                        ).launch(context);
                      }),
                    ),
                  ),
                );
              }),
            ),
            16.height,
            Text('Music', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            16.height,
            Column(
              children: List.generate(widget.playlist!.length, (index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: 200.milliseconds,
                  duration: const Duration(milliseconds: 800),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                        decoration: boxDecorationWithShadow(borderRadius: radius(12), blurRadius: 0, backgroundColor: context.cardColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Image.asset(widget.playlist![index].img!, height: 85, width: 85, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                                Container(
                                  // margin: EdgeInsets.all(4),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),

                                  ), backgroundColor: primaryColor),
                                  child: Text('Calm', style: secondaryTextStyle(size:12,color: Colors.white)),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.playlist![index].title!, style: boldTextStyle()),
                                4.height,
                                Text(widget.playlist![index].time! +' • 7 days', style: secondaryTextStyle()),
                                4.height,
                                Text('by artist', style: secondaryTextStyle()),
                              ],
                            ).paddingAll(8)
                          ],
                        ).paddingAll(8),
                      ).onTap(() {
                        MAAudioPlayScreen(
                          url: 'Images/sample.mp3',
                          bgImage: 'Images/focus_gif.gif',
                          audioName: 'Relax',
                        ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                    ),
                  ),
                );
              }).toList(),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
