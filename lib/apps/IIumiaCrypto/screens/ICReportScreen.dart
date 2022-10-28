import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICReportList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class XAxis {
  String? head;

  XAxis({this.head});
}

class ICReportScreen extends StatefulWidget {
  @override
  _ICReportScreenState createState() => _ICReportScreenState();
}

class _ICReportScreenState extends State<ICReportScreen> {
  List<XAxis> xaxis = [];
  int selected = 1;

  List list = ['04:00', '06:00', '10:00', '14:00', '18:00'];
  List<ICReportList> list2 = getReportList();

  @override
  void initState() {
    xaxis.add(XAxis(head: "10min"));
    xaxis.add(XAxis(head: "1H"));
    xaxis.add(XAxis(head: "24H"));
    xaxis.add(XAxis(head: "1M"));
    xaxis.add(XAxis(head: "3M"));
    xaxis.add(XAxis(head: "1Y"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: icScaffoldBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: icNavyBlueColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Report', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.timer, color: icWhiteColor)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: icWhiteColor)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(300)),
                    color: icNavyBlueColor,
                  ),
                ),
                Column(
                  children: [
                    16.height,
                    Wrap(
                      spacing: 16,
                      children: List.generate(
                        xaxis.length,
                        (index) {
                          XAxis data = xaxis[index];
                          bool isSelected = selected == index;
                          return Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationDefault(color: isSelected ? icSkip : icLightBlue),
                            child: Text(
                              '${data.head}',
                              style: secondaryTextStyle(color: icWhiteColor, size: 10),
                              textAlign: TextAlign.center,
                            ),
                          ).onTap(() {
                            selected = index;
                            setState(() {});
                          });
                        },
                      ),
                    ),
                    32.height,
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(borderRadius: radius(4), color: Colors.blue),
                      child: Column(
                        children: [
                          Text("\$6,539.39 USD", style: primaryTextStyle(color: icWhiteColor)),
                          Text("24 Oct, UTC +4.00", style: TextStyle(color: icWhiteColor, fontSize: 10)),
                        ],
                      ),
                    ).center(),
                  ],
                )
              ],
            ),
            Container(
              height: 200,
              child: Sparkline(
                lineWidth: 4,
                data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
                pointsMode: PointsMode.last,
                pointSize: 15,
                pointColor: icWhiteColor,
              ),
            ).paddingSymmetric(horizontal: 16),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.map((e) {
                return Text('$e', style: secondaryTextStyle(color: icWhiteColor, size: 10));
              }).toList(),
            ),
            16.height,
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var e = list2[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${e.pText}", style: boldTextStyle(color: white)),
                              4.height,
                              Text("${e.secText}", style: secondaryTextStyle(color: icSecTextColor, size: 10)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${e.pFig}", style: TextStyle(fontSize: 15, color: icSkip)),
                              4.height,
                              Text("${e.secFig}", style: secondaryTextStyle(color: icSecTextColor, size: 10)),
                            ],
                          )
                        ],
                      ).paddingAll(8).onTap(() {
                        ICActivityScreen().launch(context);
                      });
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2),
                    itemCount: list2.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
