import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MASleepDetailScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MASleepViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MAFavAndListeningNumberWidget.dart';
import '../component/MARelatedSleepComponent.dart';
import '../screens/MAAudioPlayerScreen.dart';
import '../utils/MAAppCommon.dart';
import '../utils/MAImages.dart';

class MASleepFragment extends StatefulWidget {
  @override
  MASleepFragmentState createState() => MASleepFragmentState();
}

class MASleepFragmentState extends State<MASleepFragment> {
  bool favTapped = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget relatedSleepMeditation() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Related'.toUpperCase(), style: boldTextStyle(size: 14)),
              GestureDetector(
                  onTap: () {
                    MASleepViewAllScreen().launch(context);
                  },
                  child: Text('View all', style: secondaryTextStyle(color: primaryColor)))
            ],
          ).paddingSymmetric(horizontal: 16),
          16.height,
          MARelatedSleepListComponent(totalItemToDisplay: 5),
        ],
      );
    }

    return Scaffold(

      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: () {
                    MASleepDetailScreen(
                      heroTag: relatedSleepList[0].img! + 'first',
                      img: relatedSleepList[0].img!,
                      title: relatedSleepList[0].title,
                      shortDesc: 'We can learn how to recognize when our minds are doing their normal everyday acrobatics.',
                    ).launch(context);
                  },
                  child: Hero(
                    tag: relatedSleepList[0].img! + 'first',
                    child: Image.asset(relatedSleepList[0].img!, height: 250, width: context.width(), fit: BoxFit.cover),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [favIcon(isTapped: favTapped, enableBg: true), 8.width, downloadIcon(enableBg: true)],
                ).paddingOnly(top: context.statusBarHeight + 8, left: 16, right: 16),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: playIcon('Begin').onTap(() {
                    MAAudioPlayScreen(url: MAMeditation_audio, bgImage: MAFocus_gif, audioName: relatedSleepList[0].title).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  }),
                )
              ],
            ),
            16.height,
            Text(relatedSleepList[0].title!, style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
            8.height,
            Text('45 MIN • SLEEP MUSIC', style: secondaryTextStyle(size: 12)).paddingSymmetric(horizontal: 16),
            8.height,
            Text('We can learn how to recognize when our minds are doing their normal everyday acrobatics.', style: secondaryTextStyle(size: 12)).paddingSymmetric(horizontal: 16),
            16.height,
            FavAndListeningNumberWidget(context.iconColor),
            8.height,
            Divider(),
            8.height,
            relatedSleepMeditation(),
          ],
        ),
      ),
    );
  }
}
