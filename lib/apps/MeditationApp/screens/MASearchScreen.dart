import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../models/MaBasicModel.dart';
import '../utils/MADataProvider.dart';

class MASearchScreen extends StatefulWidget {
  @override
  MASearchScreenState createState() => MASearchScreenState();
}

class MASearchScreenState extends State<MASearchScreen> {
  TextEditingController searchController = TextEditingController();
  String? searchText = '';

  List<MABasicModel> searchDataList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  void searchData() {
    if (searchText!.isNotEmpty) {
      for (int i = 0; i < musicList.length; i++) {
        if (musicList[i].title!.contains(searchText!)) {
          searchDataList.add(musicList[i]);
          setState(() {});
        }
      }
      setState(() {});
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(top: 100, bottom: 16),
            physics: NeverScrollableScrollPhysics(),
            itemCount: searchDataList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                duration: Duration(milliseconds: 600),
                child: FlipAnimation(
                  duration: Duration(milliseconds: 600),
                  flipAxis: FlipAxis.y,
                  child: searchText!.isEmpty
                      ? SizedBox()
                      : searchDataList[index].title!.contains(searchText!)
                          ? Container(
                              decoration: boxDecorationWithRoundedCorners(
                                borderRadius: radius(12),
                                decorationImage: DecorationImage(image: AssetImage(searchDataList[index].img!), fit: BoxFit.cover),
                              ),
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(bottom: 16, left: 8, right: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(searchDataList[index].title!, style: boldTextStyle(size: 14)),
                                      Text(searchDataList[index].subtitle!, style: secondaryTextStyle(size: 14)),
                                    ],
                                  ).expand(),
                                  Icon(MaterialCommunityIcons.play_circle, color: Colors.white.withOpacity(0.8)),
                                ],
                              ),
                            ).paddingSymmetric(horizontal: 8, vertical: 0)
                          : SizedBox(),
                ),
              );
            },
          ).visible(searchDataList.isNotEmpty),
          Text('No Data Found',style: secondaryTextStyle()).center().visible(searchDataList.isEmpty),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.isDarkModeOn ? Colors.black.withOpacity(0.2) : Colors.grey.shade300,
                borderRadius: radius(12),
              ),
              child: Stack(
                children: [
                  Hero(
                      tag: 'search',
                      child: SizedBox(
                        width: context.width(),
                      )),
                  TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 8, top: 12, right: 8, bottom: 0),
                        hintText: "Search",
                        hintStyle: secondaryTextStyle(),
                        // prefixIcon: prefixIcon,
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
                        suffixIcon: Icon(Icons.cancel,color: context.iconColor).onTap(() {
                          searchController.clear();
                          searchText = '';
                          setState(() {});
                        })),
                    autofocus: true,
                    onSubmitted: (s) {
                      searchDataList.clear();
                      searchText = s;
                      setState(() {});
                      log(searchText!);
                      searchData();
                    },
                  ),
                  // Icon(Icons.close)
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }
}
