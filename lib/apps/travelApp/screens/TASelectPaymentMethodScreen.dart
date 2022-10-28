import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TABookDailog.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAMyCardsComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TASelectPaymentMethodScreen extends StatefulWidget {
  @override
  TASelectPaymentMethodScreenState createState() => TASelectPaymentMethodScreenState();
}

class TASelectPaymentMethodScreenState extends State<TASelectPaymentMethodScreen> {
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

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return TABookDailog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Select Payment ',
        elevation: 0,
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              height: context.height(),
              child: Column(
                children: [
                  2.height,
                  TAMyCardsComponent(),
                  16.height,
                ],
              ),
            ),
          ),
          AppButton(
            width: context.width(),
            text: "Pay",
            textStyle: primaryTextStyle(color: Colors.white),
            color: TAColorPrimary,
            onTap: () {
              _showDialog(context);
            },
          ).paddingAll(16)
        ],
      ),
    );
  }
}
