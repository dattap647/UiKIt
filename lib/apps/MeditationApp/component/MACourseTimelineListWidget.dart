import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAAudioPlayerScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAVideoPlayScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../utils/MAAppCommon.dart';
import '../utils/MAAppContants.dart';
import '../utils/MADataProvider.dart';

class CourseListWidget extends StatefulWidget {
  final int? takeLength;

  CourseListWidget({this.takeLength});

  @override
  CourseListWidgetState createState() => CourseListWidgetState();
}

class CourseListWidgetState extends State<CourseListWidget> {
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
      itemCount: courseDetailList.take(widget.takeLength.validate()).length,
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          columnCount: 2,
          duration: Duration(milliseconds: 600),
          child: FlipAnimation(
            duration: Duration(milliseconds: 600),
            flipAxis: FlipAxis.y,
            child: TimelineTile(
              indicatorStyle: IndicatorStyle(width: 14, color: primaryColor, drawGap: true, indicatorXY: 0.0),
              isFirst: index == 0,
              afterLineStyle: LineStyle(color: primaryColor.withOpacity(0.2)),
              alignment: TimelineAlign.manual,
              lineXY: 0.0,
              hasIndicator: true,
              isLast: index == courseDetailList.take(widget.takeLength.validate()).length - 1,
              endChild: GestureDetector(
                onTap: () {
                  if (courseDetailList[index].extention.toString() == youtube.toString()) {
                    print(courseDetailList[index].attachedFile!);
                    launchUrl(courseDetailList[index].attachedFile!, forceWebView: true);
                  } else if (courseDetailList[index].extention.toString() == video) {
                    print(courseDetailList[index].attachedFile!);
                    MAVideoPlayScreen(MAMeditation_video1).launch(context);
                  } else if (courseDetailList[index].extention.toString() == audio) {
                    print(courseDetailList[index].attachedFile!);
                    MAAudioPlayScreen(url: 'images/meditationApp/sample.mp3', bgImage: 'images/meditationApp/sample.mp3', audioName: 'Relax')
                        .launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  } else {
                    //
                  }
                },
                child: Container(
                  decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      decorationImage: DecorationImage(image: AssetImage(courseDetailList[index].img!), fit: BoxFit.cover)),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(index < 2 ? Icons.check_circle : Icons.check_circle_outline, color: Colors.white.withOpacity(0.8)),
                      8.width,
                      Text(courseDetailList[index].subtitle!, style: boldTextStyle()).expand(),
                      if (courseDetailList[index].extention.toString() == youtube.toString()) Icon(MaterialCommunityIcons.youtube, color: Colors.white.withOpacity(0.8)),
                      if (courseDetailList[index].extention.toString() == video) Icon(MaterialCommunityIcons.video, color: Colors.white.withOpacity(0.8)),
                      if (courseDetailList[index].extention.toString() == audio) Icon(MaterialCommunityIcons.play_circle, color: Colors.white.withOpacity(0.8))
                    ],
                  ),
                ),
              ),
            ).paddingSymmetric(horizontal: 16),
          ),
        );
      },
    );
  }
}
