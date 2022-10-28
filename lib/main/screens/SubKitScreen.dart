import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/components/AppListWidget.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';
import '../components/FacebookdComponent.dart';

class SubKitScreen extends StatefulWidget {
  static String tag = '/SubKitScreen';
  final AppModel? appModel;

  SubKitScreen(this.appModel);

  @override
  SubKitScreenState createState() => SubKitScreenState();
}

class SubKitScreenState extends State<SubKitScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
    FacebookAudienceNetwork.init(
      //testingId: FACEBOOK_KEY,
      iOSAdvertiserTrackingEnabled: true,
    );
    loadFacebookInterstitialAd();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() async {
      if (mAdShowCount < 5) {
        mAdShowCount++;
      } else {
        mAdShowCount = 0;
        showFacebookInterstitialAd();
      }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppBarScroller(
          title: widget.appModel!.title,
          description: widget.appModel!.description,
          child: SingleChildScrollView(
            child: AppListWidget(widget.appModel!.subKit.validate()),
            padding: EdgeInsets.only(top: 16),
          ),
        ),
        bottomNavigationBar: loadFacebookBannerId(),
      ),
    );
  }
}
