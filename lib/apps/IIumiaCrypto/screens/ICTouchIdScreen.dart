import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICTouchIdScreen extends StatefulWidget {
  @override
  _ICTouchIdScreenState createState() => _ICTouchIdScreenState();
}

class _ICTouchIdScreenState extends State<ICTouchIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: icScaffoldBgColor,
        title: Text('Settings Touch ID', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.timer, color: icWhiteColor, size: 20)),
        ],
      ),
      backgroundColor: icScaffoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            64.height,
            Icon(Icons.touch_app_outlined, color: icWhiteColor, size: 150),
            32.height,
            Text('Configure Touch Id', style: boldTextStyle(size: 24, color: white)),
            Text(
              'Touch ID allows you to conveneitly and it keep your wallet secure ',
              style: secondaryTextStyle(color: icSecTextColor),
              textAlign: TextAlign.center,
            ),
            24.height,
            AppButton(
              text: 'Enable Touch Id',
              textColor: Colors.white,
              color: icSkip,
              width: context.width(),
              onTap: () {
                //
              },
            ),
            16.height,
            TextButton(onPressed: () {}, child: Text('Later', style: TextStyle(color: icSkip)))
          ],
        ).paddingAll(16),
      ),
    );
  }
}
