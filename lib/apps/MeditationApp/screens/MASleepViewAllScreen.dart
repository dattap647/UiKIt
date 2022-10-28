import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MARelatedSleepComponent.dart';

class MASleepViewAllScreen extends StatefulWidget {
  @override
  MASleepViewAllScreenState createState() => MASleepViewAllScreenState();
}

class MASleepViewAllScreenState extends State<MASleepViewAllScreen> {
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
    return Scaffold(

      appBar: appBarWidget("Sleep Meditation", elevation: 0, color: primaryColor, textColor: Colors.white),
      body: SingleChildScrollView(padding: EdgeInsets.symmetric(vertical: 16), child: MARelatedSleepListComponent()),
    );
  }
}
