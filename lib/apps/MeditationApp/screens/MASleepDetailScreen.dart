import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MACourseTimelineListWidget.dart';
import '../component/MAFavAndListeningNumberWidget.dart';
import '../utils/MAAppCommon.dart';
import '../utils/MAAppContants.dart';
import 'MAAudioPlayerScreen.dart';

class MASleepDetailScreen extends StatefulWidget {
  final String? img;
  final String? title;
  final String? shortDesc;
  final String? heroTag;

  MASleepDetailScreen({this.img, this.title, this.shortDesc, this.heroTag});

  @override
  MASleepDetailScreenState createState() => MASleepDetailScreenState();
}

class MASleepDetailScreenState extends State<MASleepDetailScreen> with TickerProviderStateMixin {
  bool favTapped = false;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 380.0,
                backgroundColor: context.scaffoldBackgroundColor,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Hero(
                              tag: widget.heroTag!,
                              child: Image.asset(widget.img!, height: 400, width: context.width(), fit: BoxFit.cover)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              backButton(context, enableBg: true),
                              Row(children: [favIcon(isTapped: favTapped, enableBg: true), 8.width, downloadIcon(enableBg: true),
                                GestureDetector(
                                  onTap: () async {
                                    MAAudioPlayScreen(url: 'Images/sample.mp3', bgImage: 'Images/focus_gif.gif', audioName: 'Relax').launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    margin: EdgeInsets.only(left: 8),
                                    decoration: boxDecorationWithShadow(backgroundColor: Colors.black54, boxShape: BoxShape.circle),
                                    child: Icon(Icons.play_arrow, color: Colors.white, size: 26),
                                  ),
                                ),])
                            ],
                          ).paddingOnly(top: context.statusBarHeight + 8, right: 16, left: 16, bottom: 16),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            right: 16,
                            child: Column(
                              children: [
                                Text(widget.title!, style: boldTextStyle(size: 20,color: Colors.white)).paddingSymmetric(horizontal: 16),
                                8.height,
                                Text('45 MIN • SLEEP MUSIC', style: secondaryTextStyle(size: 14,color: Colors.white)).paddingSymmetric(horizontal: 16),
                                8.height,
                                Text(widget.shortDesc!, style: secondaryTextStyle(size: 14,color: Colors.white), maxLines: 3, overflow: TextOverflow.ellipsis).paddingSymmetric(horizontal: 16),
                                16.height,
                                FavAndListeningNumberWidget(Colors.white),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                32.height,
                                Text('Benefits of ${widget.title} meditation', style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
                                16.height,
                                Text(longDesc, style: secondaryTextStyle(), textAlign: TextAlign.justify).paddingSymmetric(horizontal: 16),
                                16.height,
                                Text('Take a session :', style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
                                CourseListWidget(takeLength: 4)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
