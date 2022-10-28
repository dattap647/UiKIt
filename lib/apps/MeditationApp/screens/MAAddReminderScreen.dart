import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/MaBasicModel.dart';
import '../utils/MAAppColors.dart';
import '../utils/MAAppCommon.dart';

class MAAddReminderScreen extends StatefulWidget {
  @override
  MAAddReminderScreenState createState() => MAAddReminderScreenState();
}

class MAAddReminderScreenState extends State<MAAddReminderScreen> {
  DateTime dDayLocal = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  int date = DateTime.now().day;

  int currentIndex = 0;
  String? selectedDate = 'Please select time';

  List<MABasicModel> conditionList = [MABasicModel(title: 'No alert'), MABasicModel(title: 'Time'), MABasicModel(title: 'Place')];

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  String timePeriod = 'time';
  String newSelectedTime = 'Please select ';

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

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        timePeriod = newTime.period.toString();
        newSelectedTime = _time.toString().replaceAll('TimeOfDay(', '');
        newSelectedTime = newSelectedTime.toString().replaceAll(')', '');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget('Add Reminder', color: primaryColor, textColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  // controller: emailCont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8, top: 16, right: 8),
                      hintText: 'Memo',
                      hintStyle: secondaryTextStyle(),
                      prefixIcon: null,
                      labelStyle: primaryTextStyle(color: textSecondaryColor),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                      // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                      // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
                      suffixIcon: Icon(Icons.color_lens)),
                  autofocus: true,
                ),
                4.height,
                Row(
                  children: [Icon(Icons.image, color: context.iconColor), 4.width, Text('Add Image', style: primaryTextStyle())],
                ),
                16.height,
                Divider(),
                Text('Condition', style: secondaryTextStyle()),
                16.height,
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(conditionList.length, (index) {
                    return Container(
                      width: context.width() / 3 - 22,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: currentIndex == index ? primaryColor : context.cardColor,
                        borderRadius: radius(24),
                        border: Border.all(color: primaryColor),
                      ),
                      child: Text(
                        conditionList[index].title!,
                        style: primaryTextStyle(color: currentIndex == index ? Colors.white : primaryColor, size: 14),
                      ),
                    ).onTap(() {
                      currentIndex = index;
                      setState(() {});
                    });
                  }),
                ),
                16.height,
                Row(
                  children: [
                    Icon(Icons.notification_important_outlined, size: 18, color: context.iconColor),
                    4.width,
                    Text(
                      newSelectedTime + ' ' + timePeriod.replaceAll('DayPeriod.', '').capitalize(),
                      style: primaryTextStyle(),
                    ).expand(),
                    Icon(Icons.access_time, color: primaryColor).onTap(() {
                      _selectTime();

                      setState(() {});
                    })
                  ],
                )
              ],
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          appButton(context, text: "Save", bgColor: primaryColor, onTap: () {
            toast('Reminder set successfully');
            Navigator.pop(context);
          }),
          8.height,
          appButton(context, text: "Cancel", bgColor: Colors.grey, onTap: () {
            Navigator.pop(context);
          }),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
