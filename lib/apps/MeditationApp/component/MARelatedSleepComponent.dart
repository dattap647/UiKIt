import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/MASleepDetailScreen.dart';
import '../utils/MAAppColors.dart';

class MARelatedSleepListComponent extends StatefulWidget {
  final int? totalItemToDisplay;

  MARelatedSleepListComponent({this.totalItemToDisplay});

  @override
  MARelatedSleepListComponentState createState() => MARelatedSleepListComponentState();
}

class MARelatedSleepListComponentState extends State<MARelatedSleepListComponent> {
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
      children: List.generate(relatedSleepList.length, (index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          delay: 200.milliseconds,
          duration: const Duration(milliseconds: 600),
          child: SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {
                  MASleepDetailScreen(
                    heroTag: relatedSleepList[index].title! + index.toString(),
                    img: relatedSleepList[index].img!,
                    title: relatedSleepList[index].title!,
                    shortDesc: relatedSleepList[index].subtitle!,
                  ).launch(context);
                },
                child: Row(
                  children: [
                    Container(
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: secondaryColor),
                        child: Hero(
                          tag: relatedSleepList[index].title! + index.toString(),
                          child: Image.asset(relatedSleepList[index].img!, height: 100, width: 100,fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                        )),
                    8.width,
                    Column(
                      children: [
                        Text(relatedSleepList[index].subtitle!, style: boldTextStyle(size: 14), maxLines: 3),
                        8.height,
                        Row(
                          children: [
                            Text('29 minute', style: secondaryTextStyle(size: 12)),
                            16.width,
                            Text('•', style: secondaryTextStyle(size: 12)),
                            16.width,
                            Text('Female Vocal', style: secondaryTextStyle(size: 12)),
                          ],
                        )
                      ],
                    ).expand()
                  ],
                ).paddingBottom(16),
              ),
            ),
          ),
        );
      }),
    ).paddingSymmetric(horizontal: 16);
  }
}
