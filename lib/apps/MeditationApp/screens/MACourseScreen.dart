import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppCommon.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../component/MACourseTimelineListWidget.dart';

class CourseScreen extends StatefulWidget {
  final String? courseName;
  final String? courseImage;
  final String? courseOverlayImage;

  CourseScreen({this.courseName, this.courseImage, this.courseOverlayImage});

  @override
  CourseScreenState createState() => CourseScreenState();
}

class CourseScreenState extends State<CourseScreen> {
  int activePageIndex = 0;
  bool favTapped = false;

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

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            backgroundColor: primaryColor,
            title: Text(widget.courseName!),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [favIcon(isTapped: favTapped), 8.width, downloadIcon()]).paddingSymmetric(horizontal: 16, vertical: 0),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(widget.courseImage!, fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: DefaultTabController(
                    length: 6,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        16.height,
                        Text('All Lesson', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
                        8.height,
                        TabBar(
                          indicatorColor: primaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          labelPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                          indicator: BoxDecoration(),
                          isScrollable: true,
                          onTap: (i) {
                            activePageIndex = i;
                            setState(() {});
                          },
                          tabs: List.generate(courseDetailList.length, (index) {
                            return Tab(
                              child: Container(
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(12),
                                  backgroundColor: index == activePageIndex
                                      ? primaryColor.withOpacity(0.1)
                                      : appStore.isDarkModeOn
                                          ? Colors.grey.shade400
                                          : Colors.grey.shade100,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                child: Text(courseDetailList[index].title!, style: boldTextStyle(color: index == activePageIndex ? primaryColor : Colors.black54)),
                              ),
                            );
                          }),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              CourseListWidget(takeLength: courseDetailList.length),
                              CourseListWidget(takeLength: courseDetailList.length),
                              CourseListWidget(takeLength: courseDetailList.length),
                              CourseListWidget(takeLength: courseDetailList.length),
                              CourseListWidget(takeLength: courseDetailList.length),
                              CourseListWidget(takeLength: courseDetailList.length),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
