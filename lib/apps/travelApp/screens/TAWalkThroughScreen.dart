import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/model/TADefaultModel.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASigninScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class TAWalkThroughScreen extends StatefulWidget {
  static String tag = '/TAWalkThroughScreen';

  @override
  TAWalkThroughScreenState createState() => TAWalkThroughScreenState();
}

class TAWalkThroughScreenState extends State<TAWalkThroughScreen> {
  int currentPosition = 0;

  PageController pageController = PageController();

  List<TADefaultModel> walkThroughList = taWalkThrough();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    afterBuildCreated(() {
      setStatusBarColor(context.scaffoldBackgroundColor);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
          PageView.builder(
            itemCount: walkThroughList.length,
            itemBuilder: (context, i) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonCacheImageWidget(walkThroughList[i].img!, 200, fit: BoxFit.cover),
                  32.height,
                  Text(walkThroughList[currentPosition].title!, style: boldTextStyle(size: 18, letterSpacing: 1)),
                  Text(walkThroughList[currentPosition].desc!, style: secondaryTextStyle(), textAlign: TextAlign.center).paddingAll(16),
                ],
              );
            },
            controller: pageController,
            onPageChanged: (int page) {
              currentPosition = page;
              setState(() {});
            },
          ),
          DotIndicator(
            pageController: pageController,
            indicatorColor: appStore.isDarkModeOn ? white : tmPrimaryColor,
            unselectedIndicatorColor: appStore.isDarkModeOn ? context.cardColor : grey.withOpacity(0.4),
            currentBoxShape: BoxShape.circle,
            boxShape: BoxShape.circle,
            currentDotSize: 8,
            dotSize: 8,
            pages: walkThroughList,
          ).paddingBottom(100),
          InkWell(
            borderRadius: radius(25),
            child: Container(
              height: 45,
              width: 45,
              decoration: boxDecorationWithShadow(backgroundColor: TAColorPrimary, boxShape: BoxShape.circle),
              child: Icon(Icons.arrow_forward_outlined, color: Colors.white),
            ),
            onTap: () {
              if (currentPosition == 2) {
                TASigninScreen().launch(context);
              } else {
                pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
              }
            },
          ).paddingBottom(16),
          Positioned(
            top: context.statusBarHeight + 4,
            right: 0,
            child: TextButton(
              onPressed: () {
                TASigninScreen().launch(context);
              },
              child: Text('Skip', style: primaryTextStyle(color: TAColorPrimary)),
            ),
          )
        ],
      ),
    );
  }
}
