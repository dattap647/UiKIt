import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MADashboardScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppCommon.dart';
import '../utils/MAAppContants.dart';
import '../utils/MADataProvider.dart';

class MAChooseInterest extends StatefulWidget {
  @override
  _MAChooseInterestState createState() => _MAChooseInterestState();
}

class _MAChooseInterestState extends State<MAChooseInterest> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //setStatusBarColor(primaryColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: context.statusBarHeight + 16, bottom: 132, right: 12, left: 12),
            child: Column(
              children: [
                Text('How Can we help You?', style: boldTextStyle(size: 20)),
                8.height,
                Text('Choose below your interest', style: secondaryTextStyle(size: 14)),
                16.height,
                AnimationLimiter(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(interestList.length, (i) {
                      return AnimationConfiguration.staggeredGrid(
                        position: i,
                        columnCount: 2,
                        duration: Duration(milliseconds: 600),
                        child: FlipAnimation(
                          duration: Duration(milliseconds: 600),
                          flipAxis: FlipAxis.y,
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Image.asset(
                                interestList[i].img.toString(),
                                height: 100,
                                width: context.width() * 0.50 - 20,
                                fit: BoxFit.cover,
                              ).cornerRadiusWithClipRRect(8),
                              Container(
                                alignment: Alignment.center,
                                width: context.width() * 0.50 - 20,
                                height: 100,
                                decoration: boxDecorationWithRoundedCorners(borderRadius: radius(8), border: Border.all(width: 0.1), backgroundColor: interestList[i].select == true ? primaryColor.withOpacity(0.4) : Colors.black.withOpacity(0.5)),
                                child: Text(interestList[i].name.toString(), style: boldTextStyle(size: 18, color: Colors.white)),
                              ).onTap(() {
                                log(interestList[i].select.toString());
                                interestList[i].select = !interestList[i].select!;
                                setState(() {});
                              }),
                              interestList[i].select == true
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                    ).paddingAll(4)
                                  : SizedBox()
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12,
            left: 12,
            bottom: 12,
            child: Column(
              children: [
                appButton(context, text: "Confirm", bgColor: primaryColor, onTap: () {
                  sharedPreferences.setBool(IS_FIRST_TIME, false);
                  log(sharedPreferences.getBool(IS_FIRST_TIME).toString());

                MADashboardScreen().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
              }),
              8.height,
              appButton(context, text: "Skip", bgColor: Colors.grey, onTap: () {
                sharedPreferences.setBool(IS_FIRST_TIME, false);
                log(sharedPreferences.getBool(IS_FIRST_TIME).toString());

                  MADashboardScreen().launch(context,isNewTask: true, pageRouteAnimation: PageRouteAnimation.Slide);
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
