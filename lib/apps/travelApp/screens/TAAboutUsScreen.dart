import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class TAAboutUsScreen extends StatefulWidget {
  @override
  TAAboutUsScreenState createState() => TAAboutUsScreenState();
}

class TAAboutUsScreenState extends State<TAAboutUsScreen> {
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
        'About Us',
        elevation: 0,
        center: true,
        color: context.scaffoldBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            taCachedImage(ta_flight,height: 250,width:context.width(),fit: BoxFit.fill),
            16.height,
            Text(
              taShortText,
              style: primaryTextStyle(size: 14),
            ),
            8.height,
            Text(
              taLongText,
              style: primaryTextStyle(size: 14),
            ),
            16.height,
            SizedBox(height: 16, width: context.width())
          ],
        ).paddingSymmetric(horizontal: 16).center(),
      ),
    );
  }
}
