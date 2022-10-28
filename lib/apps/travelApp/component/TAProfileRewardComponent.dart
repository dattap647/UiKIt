import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAProfileRewardComponent extends StatefulWidget {
  @override
  TAProfileRewardComponentState createState() => TAProfileRewardComponentState();
}

class TAProfileRewardComponentState extends State<TAProfileRewardComponent> {
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
    return HorizontalList(
      spacing: 16,
      itemCount: profileRewardList.length,
      itemBuilder: (context, i) {
        return Container(
          decoration: boxDecorationWithShadow(borderRadius: radius(taDefaultRadius.toDouble()), backgroundColor: appStore.cardColor, blurRadius: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              16.height,
              Text(
                'MEMBERSHIP',
                style: secondaryTextStyle(size: 12),
              ).paddingSymmetric(horizontal: 16),
              8.height,
              Text(
                profileRewardList[i].title.validate(),
                style: boldTextStyle(size: 20),
              ).paddingSymmetric(horizontal: 16),
              8.height,
              SizedBox(
                child: CircularProgressIndicator(value: 5.0, semanticsValue: 'hello', valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow.shade800), strokeWidth: 5, color: Colors.grey),
                height: 80.0,
                width: 80.0,
              ),
              8.height,
              AppButton(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                height: 20,
                color: appStore.isDarkModeOn ? context.cardColor : TAColorSecondary,
                elevation: 0,
                text: 'Redeem miles',
                textStyle: secondaryTextStyle(color: TAColorPrimary),
                onTap: () {
                  //
                },
              ).paddingAll(16)
            ],
          ),
        );
      },
    );
  }
}
