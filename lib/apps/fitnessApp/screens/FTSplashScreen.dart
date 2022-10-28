import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FTSignInScreen.dart';

class FTSplashScreen extends StatefulWidget {
  @override
  State<FTSplashScreen> createState() => _FTSplashScreenState();
}

class _FTSplashScreenState extends State<FTSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    5.seconds.delay;
    FTSignInScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(appStore.isDarkModeOn ? Theme.of(context).scaffoldBackgroundColor : Colors.red);

    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Theme.of(context).scaffoldBackgroundColor : Colors.red,
      body: Center(
        child: Text(
          'OVERRUN',
          style: GoogleFonts.righteous(
            textStyle: TextStyle(letterSpacing: 1.5, fontSize: 40.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
