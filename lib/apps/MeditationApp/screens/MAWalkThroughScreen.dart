import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppCommon.dart';
import '../utils/MADataProvider.dart';
import '../utils/MAWalkThroughBg.dart';
import 'MAChooseInterest.dart';

class MAWalkThroughScreen extends StatefulWidget {
  @override
  _MAWalkThroughScreenState createState() => _MAWalkThroughScreenState();
}

class _MAWalkThroughScreenState extends State<MAWalkThroughScreen> {
  int? currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: context.height(),
              child: PageView.builder(
                itemCount: walkThroughClass.length,
                controller: pageController,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      MAWalkThroughBg(),
                      Image.asset(walkThroughClass[i].img.toString(), height: MediaQuery.of(context).size.height * 0.6),
                    ],
                  );
                },
                onPageChanged: (int i) {
                  currentIndex = i;
                  setState(() {});
                },
              ),
            ),
            Positioned(
              bottom: 24,
              right: 0,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(walkThroughClass[currentIndex!.toInt()].text.toString(), style: boldTextStyle(color: primaryColor, size: 20)),
                  16.height,
                  Text(walkThroughClass[currentIndex!.toInt()].name.toString(), style: secondaryTextStyle(size: 14), textAlign: TextAlign.center).paddingSymmetric(horizontal: 16),
                  32.height,
                  dotIndicator(walkThroughClass,currentIndex),
                  16.height,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                        color: primaryColor,
                      ),
                      child: MaterialButton(
                        child: Text(currentIndex!.toInt() >= 2 ? "Get Started" : "Next", style: primaryTextStyle(color: whiteColor)),
                        onPressed: () {
                          if (currentIndex!.toInt() >= 2) {
                            MAChooseInterest().launch(context);
                            print("1");

                          } else {
                            pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
