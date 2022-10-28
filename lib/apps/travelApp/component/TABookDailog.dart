import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADashboardScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TABookDailog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Flight Booked'),
      elevation: 10,
      content: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ta_nodata, width: 250, height: 150, fit: BoxFit.fill),
          8.height,
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ORD', style: secondaryTextStyle(size: 12)),
                Text('- - - -', style: secondaryTextStyle(size: 12)),
                Icon(Ionicons.ios_airplane, size: 12),
                Text('- - - -', style: secondaryTextStyle(size: 12)),
                Text('NYC', style: secondaryTextStyle(size: 12))
              ],
            ).paddingSymmetric(horizontal: 16),
          ),
          16.height,
          AppButton(
            height: 50,
            width: context.width(),
            color: TAColorPrimary,
            child: Text("Add to Calender", style: primaryTextStyle(color: whiteColor)),
            onTap: () {
              toast("Added to Calender");
              TADashboardScreen().launch(context, isNewTask: true);
            },
          ),
          16.height,
          Container(
            alignment: Alignment.center,
            height: 50,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: appStore.cardColor,
              borderRadius: radius(12),
              border: Border.all(color: TAColorPrimary),
            ),
            child: Text("Close", style: primaryTextStyle(color: TAColorPrimary)),
          ).onTap(() {
            TADashboardScreen().launch(context, isNewTask: true);
          }),
        ],
      )),
      actions: <Widget>[],
    );
  }
}
