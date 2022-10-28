import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAAudioPlayerScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MADataProvider.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class MusicListComponent extends StatefulWidget {
  // String? searchText;
  //
  // MusicListComponent(this.searchText);

  @override
  MusicListComponentState createState() => MusicListComponentState();
}

class MusicListComponentState extends State<MusicListComponent> {
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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: musicList.length,
      padding: EdgeInsets.only(top: 16),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 2,
          duration: Duration(milliseconds: 600),
          child: FlipAnimation(
            duration: Duration(milliseconds: 600),
            flipAxis: FlipAxis.y,
            child: Container(
              decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), decorationImage: DecorationImage(image: AssetImage(musicList[index].img!), fit: BoxFit.cover)),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(musicList[index].title!, style: boldTextStyle(size: 14)),
                      Text(musicList[index].subtitle!, style: secondaryTextStyle(size: 14)),
                    ],
                  ).expand(),
                  Icon(MaterialCommunityIcons.play_circle, color: Colors.white.withOpacity(0.8)),
                ],
              ),
            ).paddingSymmetric(horizontal: 8, vertical: 0).onTap(() {
              MAAudioPlayScreen(url: MAMeditation_audio, bgImage: MAFocus_gif, audioName: musicList[index].title!).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
            }),
          ),
        );
      },
    );
  }
}
