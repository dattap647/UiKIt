import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TACalenderComponent extends StatefulWidget {
  static String tag = '/TACalenderComponent';

  @override
  TACalenderComponentState createState() => TACalenderComponentState();
}

class TACalenderComponentState extends State<TACalenderComponent> {
  DateTime selectedDate = DateTime.now();

  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();

  List<String> listOfMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

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
    return Container(
      height: 70,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 2),
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 0);
        },
        itemCount: 365,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentDateSelectedIndex = index;
                selectedDate = DateTime.now().add(Duration(days: index));
              });
            },
            child: Container(
              height: 60,
              width: 40,
              alignment: Alignment.center,
              decoration: boxDecorationWithShadow(
                borderRadius: radius(taDefaultRadius.toDouble()),
                blurRadius: 2,
                spreadRadius: 1,
                backgroundColor: currentDateSelectedIndex == index
                    ? appStore.isDarkModeOn
                        ? TAColorSecondary.withOpacity(0.5)
                        : TAColorSecondary
                    : context.cardColor,
                border: Border.all(color: currentDateSelectedIndex == index ? TAColorSecondary.withOpacity(0.5) : context.cardColor),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(listOfDays[DateTime.now().add(Duration(days: index)).weekday - 1].toString(),
                      style: secondaryTextStyle(size: 14, color: currentDateSelectedIndex == index ? white : TAColorPrimary)),
                  4.height,
                  Text(
                    DateTime.now().add(Duration(days: index)).day.toString(),
                    style: boldTextStyle(size: 18, color: currentDateSelectedIndex == index ? white : black),
                  ),
                  4.height,
                ],
              ),
            ).paddingLeft(16.0),
          );
        },
      ),
    );
  }
}
