import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAMyCardsComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TAMyCardScreen extends StatefulWidget {
  @override
  TAMyCardScreenState createState() => TAMyCardScreenState();
}

class TAMyCardScreenState extends State<TAMyCardScreen> {
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
        'My Cards',
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: TAMyCardsComponent().paddingAll(16),
    );
  }
}
