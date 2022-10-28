import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TANotificationScreen extends StatefulWidget {
  static String tag = '/TANotificationScreen';

  @override
  TANotificationScreenState createState() => TANotificationScreenState();
}

class TANotificationScreenState extends State<TANotificationScreen> {
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
      appBar: appBarWidget(
        'Notifications',
        elevation: 0,
        center: true,
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: Column(
        children: notificationList.map((e) {
          return Container(
            width: context.width(),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.all(8),
            decoration: boxDecorationWithShadow(backgroundColor: appStore.cardColor, borderRadius: radius(12), spreadRadius: 1, blurRadius: 2),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: context.width() / 3,
                            child: Text(
                              e.title.validate(),
                              style: boldTextStyle(),
                              maxLines: 2,
                            )),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.access_time_rounded, color: context.iconColor, size: 12),
                            4.width,
                            Text(e.subtitle.validate(), style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                      ],
                    ),
                    8.height,
                    Text(e.desc.validate(), style: primaryTextStyle(size: 14), maxLines: 1),
                  ],
                ).paddingLeft(76),
                Container(
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: TAColorPrimary, borderRadius: radius(12)),
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.all(2),
                  child: Icon(e.iconData, color: Colors.white, size: 24),
                ),
              ],
            ),
          );
        }).toList(),
      ).paddingSymmetric(vertical: 8),
    );
  }
}
