import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAAudioPlayerScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppCommon.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MAMusicListComponent.dart';
import '../utils/MADataProvider.dart';
import '../utils/MAImages.dart';

class MAMusicViewAllScreen extends StatefulWidget {
  @override
  MAMusicViewAllScreenState createState() => MAMusicViewAllScreenState();
}

class MAMusicViewAllScreenState extends State<MAMusicViewAllScreen> {
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

      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: context.statusBarHeight + 16, bottom: 16),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  54.height,
                  Image.asset(musicList[0].img!,height: 120,width: 120,fit: BoxFit.cover).cornerRadiusWithClipRRect(12).paddingSymmetric(horizontal: 16),
                  8.height,
                  Text(musicList[0].title!, style: boldTextStyle()).paddingSymmetric(horizontal: 16),
                  4.height,
                  Text('by artist', style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
                  16.height,
                  Row(
                    children: [
                      playIcon('Play',color: primaryColor).onTap(() {
                        MAAudioPlayScreen(
                          url: MAMeditation_audio,
                          bgImage: MAFocus_gif,
                          audioName: relatedSleepList[0].title,
                        ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                      16.width,
                      playIcon('Shuffle',icon: MaterialCommunityIcons.shuffle_variant).onTap(() {
                        toast(musicList[0].title!+' is on Shuffle');
                      }),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  Divider(color: viewLineColor).paddingSymmetric(horizontal: 16),
                  16.height,
                  Text('Top Track', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
                  MusicListComponent(),
                ],
              ),
              backButton(context, enableBg: true).paddingOnly(left: 16, top: 0),
            ],
          )),
    );
  }
}
