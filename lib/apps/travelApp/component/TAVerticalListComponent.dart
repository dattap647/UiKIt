import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAVerticalComponent extends StatefulWidget {
  @override
  TAVerticalComponentState createState() => TAVerticalComponentState();
}

class TAVerticalComponentState extends State<TAVerticalComponent> {
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
      children: popularList.map((e) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.all(8),
          decoration: boxDecorationWithShadow(borderRadius: radius(12), backgroundColor: appStore.cardColor),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.bottomCenter,
                    decoration: boxDecorationWithShadow(borderRadius: radius(12), backgroundColor: appStore.cardColor),
                    child: Text('22', style: boldTextStyle(size: 14)),
                  ),
                  Container(
                    height: 24,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: boxDecorationWithShadow(borderRadius: radius(12), backgroundColor: TAColorPrimary /*appStore.isDarkModeOn?Colors.white: appStore.cardColor*/),
                    child: Text('jan', style: boldTextStyle(size: 14, color: Colors.white)),
                  ),
                ],
              ),
              8.width,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.title.validate(),
                    style: boldTextStyle(),
                  ),
                  4.height,
                  Text(e.subtitle.validate(), style: secondaryTextStyle()),
                ],
              )
            ],
          ),
        ).onTap(() {
          TADetailScreen().launch(context);
        });
      }).toList(),
    );
  }
}
