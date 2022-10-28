// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MADashboardScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppContants.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/MAImages.dart';
import 'MAWalkThroughScreen.dart';

class MASplashScreen extends StatefulWidget {
  @override
  _MASplashScreenState createState() => _MASplashScreenState();
}

class _MASplashScreenState extends State<MASplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await 2.seconds.delay;
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    MAWalkThroughScreen().launch(context, isNewTask: true);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MASplashImage,
                height: 200, width: 200, fit: BoxFit.cover),
            16.height,
            Text(appName, style: boldTextStyle()),
          ],
        ),
      ),
    );
  }
}
