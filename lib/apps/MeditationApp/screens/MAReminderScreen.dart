import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import 'MAAddReminderScreen.dart';

class MAReminderScreen extends StatefulWidget {
  @override
  MAReminderScreenState createState() => MAReminderScreenState();
}

class MAReminderScreenState extends State<MAReminderScreen> {
  DateTime dDayLocal = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int date = DateTime.now().day;

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Reminder'),
        actions: [
          GestureDetector(
            onTap: (){

              MAAddReminderScreen().launch(context);
            },
              child: Icon(Icons.add, color: Colors.white).paddingSymmetric(horizontal: 16)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.height,
            CalendarTimeline(
              initialDate: DateTime(year, month, date),
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2023, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: primaryColor.withOpacity(0.3),
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
            16.height,
            AnimationLimiter(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(reminderList.take(3).length, (i) {
                  return AnimationConfiguration.staggeredGrid(
                    position: i,
                    columnCount: 2,
                    duration: Duration(milliseconds: 600),
                    child: FlipAnimation(
                      duration: Duration(milliseconds: 600),
                      flipAxis: FlipAxis.y,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            reminderList[i].img.toString(),
                            height: 100,
                            width: context.width() * 0.50 - 24,
                            fit: BoxFit.cover,
                            colorBlendMode: BlendMode.darken,
                          ).cornerRadiusWithClipRRect(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(reminderList[i].time!, style: boldTextStyle(color: Colors.white, size: 20)),
                              4.height,
                              Text(reminderList[i].title!, style: boldTextStyle(color: Colors.white)),
                              8.height,
                            ],
                          ).paddingLeft(8),
                          Positioned(
                            top: 0,
                            right: 8,
                            child: Transform.scale(
                                scale: 1,
                                child: Switch(
                                  onChanged: (v) {
                                    reminderList[i].isSelected = v;
                                    setState(() {});
                                  },
                                  value: reminderList[i].isSelected,
                                  activeColor: primaryColor,
                                  activeTrackColor: primaryColor.withOpacity(0.5),
                                  inactiveThumbColor: Colors.grey,
                                  inactiveTrackColor: Colors.grey.shade200,
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ).paddingSymmetric(horizontal: 16),
            ),
            16.height,
            Text('Upcoming Reminders', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            8.height,
            Column(
              children: List.generate(upcomingList.length, (index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: 200.milliseconds,
                  duration: const Duration(milliseconds: 600),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            upcomingList[index].img!,
                            height: 50,
                            width: context.width(),
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(upcomingList[index].time! + ' : ', style: boldTextStyle(color: Colors.white, size: 14)),
                              8.width,
                              Text(upcomingList[index].title!, style: boldTextStyle(color: Colors.white, size: 14)).expand(),
                              Transform.scale(
                                  scale: 1,
                                  child: Switch(
                                    onChanged: (v) {
                                      upcomingList[index].isSelected = v;
                                      setState(() {});
                                    },
                                    value: upcomingList[index].isSelected,
                                    activeColor: primaryColor,
                                    activeTrackColor: primaryColor.withOpacity(0.5),
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.grey.shade200,
                                  )),
                            ],
                          ).paddingAll(8),
                        ],
                      ).paddingBottom(8),
                    ),
                  ),
                );
              }),
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
    );
  }
}
