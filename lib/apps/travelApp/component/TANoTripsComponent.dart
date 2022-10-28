import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/TASearchScreen.dart';

class NoTripsComponent extends StatefulWidget {
  @override
  NoTripsComponentState createState() => NoTripsComponentState();
}

class NoTripsComponentState extends State<NoTripsComponent> {
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cachedImage(ta_nodata, height: 250, width: 250),
        Text('No upcoming trips', style: boldTextStyle()),
        8.height,
        Text('When you book a trip, you\'ll your trips here', style: secondaryTextStyle()),
        16.height,
        AppButton(
          padding: EdgeInsets.zero,
          height: 40,
          width: context.width() / 2,
          color: TAColorPrimary,
          elevation: 0,
          text: 'Start Searching',
          textStyle: primaryTextStyle(color: Colors.white),
          onTap: () {
            TASearchScreen().launch(context);
          },
        )
      ],
    ).paddingAll(16);
  }
}
