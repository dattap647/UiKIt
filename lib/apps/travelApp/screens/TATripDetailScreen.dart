import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAPopularHorizontalList.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAVerticalListComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';

class TATripDetailScreen extends StatefulWidget {
  static String tag = '/TATripDetailScreen';

  @override
  TATripDetailScreenState createState() => TATripDetailScreenState();
}

class TATripDetailScreenState extends State<TATripDetailScreen> with SingleTickerProviderStateMixin {
  List<IconData> feelingList = [Icons.water, Icons.sunny, Icons.hourglass_top_outlined];
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);

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
    Widget taProfileTripWidget() {
      return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          TAPopularHorizontalList().paddingSymmetric(horizontal: 8),
          16.height,
          TAVerticalComponent(),
        ]),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            expandedHeight: 270,
            backgroundColor: context.cardColor,
            flexibleSpace: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(height: 270, width: context.width()),
                Stack(
                  children: [
                    Image.asset(ta_travel1, height: 270, width: context.width(), fit: BoxFit.cover),
                    Row(
                      children: [
                        taBackButton(context, iconColor: Colors.white),
                        8.width,
                        Text('New York', style: boldTextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 270,
                  decoration: boxDecorationWithShadow(
                      backgroundColor: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white54,
                          Colors.white,
                        ],
                      )),
                ),
                TabBar(
                  tabs: [
                    Tab(text: 'Popular'),
                    Tab(text: 'UpComing'),
                    Tab(text: 'Recommonded'),
                  ],
                  controller: controller,
                  indicatorColor: TAColorPrimary,
                  unselectedLabelColor: Colors.grey.shade700,
                  labelColor: Colors.black,
                  physics: AlwaysScrollableScrollPhysics(),
                  isScrollable: true,
                  labelStyle: boldTextStyle(),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            floating: true,
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(controller: controller, children: [
              taProfileTripWidget(),
              taProfileTripWidget(),
              taProfileTripWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
