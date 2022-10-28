import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/component/MADailyCalmExersiceWidget.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MACourseScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppCommon.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MARecommondedForYouHomeWidget.dart';
import '../utils/MADataProvider.dart';

class MAHomeFragment extends StatefulWidget {
  @override
  _MAHomeFragmentState createState() => _MAHomeFragmentState();
}

class _MAHomeFragmentState extends State<MAHomeFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget pickTopic() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Choose what you like'.toUpperCase(), style: boldTextStyle(size: 16)),
          8.height,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(whatYouLikeList.length, (index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: whatYouLikeList[index].isSelected ? primaryColor : context.cardColor,
                  borderRadius: radius(24),
                  border: Border.all(color: primaryColor),
                ),
                child: Text(whatYouLikeList[index].title!, style: primaryTextStyle(color: whatYouLikeList[index].isSelected ? Colors.white : primaryColor, size: 14)),
              ).onTap(() {
                whatYouLikeList[index].isSelected = !whatYouLikeList[index].isSelected;
                setState(() {});
              });
            }),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBarWidget(
        "",
        color: context.scaffoldBackgroundColor,
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Hello John,', style: boldTextStyle(size: 18)),
            4.height,
            Text('We wish you have a good day ', style: secondaryTextStyle()),
            4.height,
          ],
        ),
        elevation: 0,
        showBack: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, bottom: 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            todayReminder(),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courseList.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: 200.milliseconds,
                    duration: Duration(milliseconds: 600),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            CourseScreen(courseImage: courseList[index].img, courseName: courseList[index].title).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                          },
                          child: SizedBox(
                            height: 150,
                            width: 200,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: primaryColor.withOpacity(0.1)),
                                  child: Image.asset(courseList[index].img!, width: context.width(), height: context.height(), fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(courseList[index].title!, style: boldTextStyle(color: Colors.white)),
                                    Text(courseList[index].subtitle!, style: secondaryTextStyle(color: Colors.white.withOpacity(0.8))),
                                    16.height,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(courseList[index].time!, style: secondaryTextStyle(color: Colors.white)),
                                        playIcon('Start'),
                                      ],
                                    ).paddingOnly(right: 16)
                                  ],
                                ).paddingSymmetric(horizontal: 8, vertical: 16),
                                Positioned(top: 10, right:26, child:CircleAvatar(backgroundImage: AssetImage(courseList[index].characterImg!),backgroundColor: context.cardColor,maxRadius: 25,))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            pickTopic().paddingSymmetric(horizontal: 16),
            DailyCalmExerciseWidget(),
            MARecommendedForYou(),
          ],
        ),
      ),
    );
  }
}
