import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TACalenderComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAFlightDetailCardComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAFlightSheetSelectionScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAFlightDetailScreen extends StatefulWidget {
  @override
  TAFlightDetailScreenState createState() => TAFlightDetailScreenState();
}

class TAFlightDetailScreenState extends State<TAFlightDetailScreen> {
  List<Widget> flightTicketList = [
    TAFlightDetailCard(),
    TAFlightDetailCard(),
    TAFlightDetailCard(),
  ];
  int selectedIndex = -1;

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
      appBar: appBarWidget('', backWidget: taBackButton(context, iconColor: context.iconColor), color: context.scaffoldBackgroundColor, elevation: 0),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              children: List.generate(flightTicketList.length, (index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: boxDecorationWithShadow(
                      backgroundColor: index == selectedIndex
                          ? TAColorSecondary.withOpacity(0.5)
                          : appStore.isDarkModeOn
                              ? appStore.cardColor
                              : Colors.white,
                      borderRadius: radius(taDefaultRadius.toDouble()),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                    child: flightTicketList[index],
                  ),
                );
              }),
            ),
          ),
          TACalenderComponent(),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              width: context.width(),
              text: "Continue",
              textStyle: primaryTextStyle(color: Colors.white),
              color: TAColorPrimary,
              onTap: () {
                TAFlightSheetSelectionScreen().launch(context);
              },
            ).paddingAll(16),
          ),
        ],
      ),
    );
  }
}
