import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppCommon.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/MADataProvider.dart';
import 'MAPlayListScreen.dart';

class MAAccountInfoScreen extends StatefulWidget {
  @override
  MAAccountInfoScreenState createState() => MAAccountInfoScreenState();
}

class MAAccountInfoScreenState extends State<MAAccountInfoScreen> {
  TooltipBehavior? tooltipBehavior;
  List<WeekData> data = [WeekData('Mon', 35), WeekData('Tue', 28), WeekData('Wed', 34), WeekData('Thu', 32), WeekData('Fri', 40), WeekData('Sat', 50), WeekData('Sun', 40)];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tooltipBehavior = TooltipBehavior(enable: true, borderWidth: 1.5, textStyle: secondaryTextStyle(color: textSecondaryColorGlobal));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget("Account Info", elevation: 0, color: primaryColor, textColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(MAProfile_image)),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Dover', style: boldTextStyle(size: 18)),
                      4.height,
                      Text('john@gmail.com', style: secondaryTextStyle()),
                    ],
                  ).expand(),
                  Icon(SimpleLineIcons.settings, size: 20).onTap(() {
                    Navigator.pop(context);
                  }).paddingRight(8)
                ],
              ),
            ),
            16.height,
            Container(
              height: 250,
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
              child: SfCartesianChart(
                title: ChartTitle(text: 'This week meditation', textStyle: secondaryTextStyle(size: 14, color: primaryColor)),
                primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0), axisLine: AxisLine(width: 0)),
                tooltipBehavior: tooltipBehavior,
                series: <ChartSeries<WeekData, String>>[
                  LineSeries<WeekData, String>(
                      dataSource: data,
                      xValueMapper: (WeekData sales, _) => sales.year,
                      yValueMapper: (WeekData sales, _) => sales.sales,
                      name: 'Meditation',
                      dataLabelSettings: DataLabelSettings(isVisible: true,color: textSecondaryColorGlobal))
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Text('Overview', style: boldTextStyle()).paddingLeft(8),
                  Divider(color: viewLineColor),
                  16.height,
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    children: [
                      SizedBox(
                        width: context.width() / 3 - 28,
                        child: overViewWidget(Icons.video_collection_outlined, 'Lesson Count', '50'),
                      ),
                      SizedBox(
                        width: context.width() / 3 - 28,
                        child: overViewWidget(MaterialCommunityIcons.alarm, 'Meditation minute', '432'),
                      ),
                      SizedBox(
                        width: context.width() / 3 - 28,
                        child: overViewWidget(Octicons.calendar, 'Current Streak', '20'),
                      ),
                    ],
                  ),
                  8.height,
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
              child: Column(
                children: [
                  appSettingData(
                      title: "Go Premium",
                      width: context.width(),
                      icon: MaterialCommunityIcons.star_circle_outline,
                      onTap: () {
                        toast("Go Premium");
                      }),
                  Divider(color: viewLineColor),
                  appSettingData(
                      title: "My Favourite",
                      width: context.width(),
                      icon: MaterialIcons.favorite_border,
                      onTap: () {
                        MAPlayListScreen(screenName: 'My Favourite', playlist: favList).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                  Divider(color: viewLineColor),
                  appSettingData(
                      title: "My Offline",
                      width: context.width(),
                      icon: MaterialCommunityIcons.progress_download,
                      onTap: () {
                        MAPlayListScreen(screenName: 'My Offline', playlist: offLineList).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

class WeekData {
  WeekData(this.year, this.sales);

  final String year;
  final double sales;
}
