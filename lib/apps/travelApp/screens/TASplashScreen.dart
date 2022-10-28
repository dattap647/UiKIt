import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TASplashScreen extends StatefulWidget {
  static String tag = '/TASplashScreen';

  @override
  TASplashScreenState createState() => TASplashScreenState();
}

class TASplashScreenState extends State<TASplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds:3000));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCubic);

    animationController.forward();

    Timer(Duration(seconds: 5), () {
      finish(context);
      TAWalkThroughScreen().launch(context);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.cardColor,
      body: ScaleTransition(
        scale: animation,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: TAColorPrimary),
              child: Icon(Icons.airplanemode_on, color: Colors.white),
            ),
            16.width,
            Text('Travel', style: GoogleFonts.lacquer(textStyle: TextStyle(fontSize: 22))),
            // Text('Travel', style: boldTextStyle(size: 20,fontFamily: 'Robert Leuschke'))
          ],
        ).center(),
      ),
    );
  }
}
