import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TANoTripsComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAMyTripCard.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TATripsScreen extends StatefulWidget {
  @override
  TATripsScreenState createState() => TATripsScreenState();
}

class TATripsScreenState extends State<TATripsScreen> {
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
    Widget _tabSection(BuildContext context) {
      return DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: boxDecorationWithShadow(borderRadius: radius(0), spreadRadius: 0, backgroundColor: appStore.cardColor, blurRadius: 0),
              child: TabBar(
                indicatorColor: TAColorPrimary,
                labelStyle: boldTextStyle(),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey.shade700,
                labelColor: context.iconColor,
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Upcoming"),
                ],
              ),
            ),
            Container(
              //Add this to give height
              height: context.height(),
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      8.height,
                      TAMyTripCard(name: 'Grand Tour of USA', locationName: 'America').paddingOnly(top: 8),
                      8.height,
                      TAMyTripCard(name: '5 days in Europe', locationName: 'Europe').paddingOnly(top: 8, bottom: 16),
                    ],
                  ),
                  NoTripsComponent().center(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(child: _tabSection(context).paddingTop(context.statusBarHeight + 8)),
    );
  }
}
