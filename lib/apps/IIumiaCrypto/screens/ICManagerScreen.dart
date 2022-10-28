import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDetailCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICRevenueList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICRevenueScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class XAxis {
  String? head;

  XAxis({this.head});
}

class ICManagerScreen extends StatefulWidget {
  @override
  _ICManagerScreenState createState() => _ICManagerScreenState();
}

class _ICManagerScreenState extends State<ICManagerScreen> {
  String? dropdownValue = 'All';
  int selected = 1;

  List dropdownItems = ['All'];
  List<XAxis> axis = [];
  List<ICRevenueList1> list = getRevenueList1();
  List<DetailCardTranList> managementList = getManagementList();

  @override
  void initState() {
    axis.add(XAxis(head: "Nov"));
    axis.add(XAxis(head: "Dec"));
    axis.add(XAxis(head: "Jan"));
    axis.add(XAxis(head: "Feb"));
    axis.add(XAxis(head: "Mar"));
    axis.add(XAxis(head: "Apr"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: icScaffoldBgColor,
        title: Text('Manager Currency', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: icWhiteColor, size: 20)),
        ],
      ),
      backgroundColor: icScaffoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: boxDecorationDefault(color: icLightBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: icNavyBlueColor),
                    child: DropdownButton(
                      elevation: 2,
                      value: dropdownValue,
                      onChanged: (dynamic newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      dropdownColor: icScaffoldBgColor,
                      icon: Icon(Icons.arrow_drop_down, color: icWhiteColor),
                      items: dropdownItems.map((e) {
                        return DropdownMenuItem(
                          child: Text(e, style: TextStyle(color: icWhiteColor, fontSize: 10)),
                          value: e,
                        );
                      }).toList(),
                      underline: SizedBox(),
                    ),
                  ),
                  16.height,
                  Text("Balance", style: secondaryTextStyle(color: icWhiteColor)),
                  16.height,
                  Row(
                    children: [
                      Text('\$ 4,781.98', style: TextStyle(color: icSkip, fontSize: 35)),
                      16.width,
                      Icon(Icons.trending_down, color: Colors.red),
                      4.width,
                      Text('-\$ 1.76', style: secondaryTextStyle(color: Colors.red))
                    ],
                  )
                ],
              ).paddingAll(16),
            ),
            16.height,
            Text('Revenue Flow', style: boldTextStyle(color: white)),
            16.height,
            Wrap(
              spacing: 16,
              children: List.generate(
                axis.length,
                (index) {
                  XAxis data = axis[index];
                  bool isSelected = selected == index;
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: isSelected ? icSkip : icLightBlue),
                    child: Text(
                      '${data.head}',
                      style: secondaryTextStyle(color: icWhiteColor, size: 10),
                    ),
                  ).onTap(() {
                    selected = index;
                    setState(() {});
                  }, highlightColor: icLightBlue);
                },
              ),
            ),
            16.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Text("\$ 1545.4", style: boldTextStyle(size: 24, color: white)).center(),
                    decoration: BoxDecoration(
                      border: Border.all(width: 8, color: Colors.blue),
                      color: icScaffoldBgColor,
                      borderRadius: radius(100),
                    ),
                  ),
                  16.width,
                  Container(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list.map((e) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(color: e.c, borderRadius: BorderRadius.circular(8)),
                                ),
                                8.width,
                                Text("${e.h1}", style: boldTextStyle(color: white)),
                                8.width,
                                Text("${e.h2}", style: TextStyle(color: e.c, fontSize: 15)),
                              ],
                            ),
                            4.height
                          ],
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            16.height,
            Text('Management History', style: boldTextStyle(color: white)),
            16.height,
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: managementList.length,
              itemBuilder: (context, index) {
                DetailCardTranList data = managementList[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationDefault(color: icLightBlue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.workspaces_filled, color: icWhiteColor),
                        decoration: BoxDecoration(color: icSkip, borderRadius: radius(4)),
                      ),
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: data.img, style: boldTextStyle(color: white)),
                                TextSpan(text: data.pText, style: secondaryTextStyle(color: icSecTextColor, size: 10)),
                              ],
                            ),
                          ),
                          4.height,
                          Text(data.secText!, style: secondaryTextStyle(color: icSecTextColor, size: 10))
                        ],
                      ),
                      Text(data.fig!, style: secondaryTextStyle(color: icSkip, size: 10))
                    ],
                  ),
                ).onTap(() {
                  ICRevenueScreen().launch(context);
                }, highlightColor: icLightBlue);
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
