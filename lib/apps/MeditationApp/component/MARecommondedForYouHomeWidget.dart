import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAtext_gradient.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/MACourseScreen.dart';
import '../utils/MAAppColors.dart';
import '../utils/MADataProvider.dart';

class MARecommendedForYou extends StatefulWidget {
  @override
  MARecommendedForYouState createState() => MARecommendedForYouState();
}

class MARecommendedForYouState extends State<MARecommendedForYou> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Recommended For You'.toUpperCase(), style: boldTextStyle(size: 14)).paddingSymmetric(horizontal: 16),
        16.height,
        SizedBox(
          height: 200,
          child: ListView(
            padding: EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            children: courseList.map((e) {
              return GestureDetector(
                onTap: () {
                  CourseScreen(courseImage: e.img, courseName: e.title).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: primaryColor.withOpacity(0.1)),
                      child: Stack(
                        children: [
                          Image.asset(e.img!, height: 150, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                          Positioned(
                            bottom: 12,
                            right: 0,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: MAGradientText(
                                e.title!,
                                style: boldTextStyle(size: 28),
                                gradient: LinearGradient(
                                  colors: [
                                    primaryColor.withOpacity(0.6),
                                    Colors.white.withOpacity(0.8),
                                  ],
                                ),
                              ),
                            ).cornerRadiusWithClipRRect(12),
                          )
                        ],
                      ),
                    ).paddingRight(16),
                    8.height,
                    Text(e.title!, style: boldTextStyle()),
                    4.height,
                    Text(e.subtitle!.toUpperCase() + ' • ' + e.time!, style: secondaryTextStyle()),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
