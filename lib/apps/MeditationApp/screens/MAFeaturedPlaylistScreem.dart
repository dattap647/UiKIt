import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MAMusicListComponent.dart';

class MAFeaturedPlaylistScreen extends StatefulWidget {
  late final String? playlistName;
  late final String? bgImg;

  MAFeaturedPlaylistScreen({this.playlistName, this.bgImg});

  @override
  MAFeaturedPlaylistScreenState createState() => MAFeaturedPlaylistScreenState();
}

class MAFeaturedPlaylistScreenState extends State<MAFeaturedPlaylistScreen> {
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
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Hero(
              tag: widget.playlistName!,
              child: Container(
                height: context.height(),
                width: context.width(),
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.bgImg!), fit: BoxFit.cover, opacity: 0.5), color: Colors.black),
              ),
            ),
          ),
          MusicListComponent().paddingTop(100),
          Positioned(
            top: context.statusBarHeight+16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.width,
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: Colors.black45),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white.withOpacity(0.8),
                      size: 22,
                    ),
                  ),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Marquee(child: Text(widget.playlistName!, style: boldTextStyle(color: Colors.white,size: 24)),direction: Axis.horizontal,
                    animationDuration: Duration(milliseconds: 50),),
                    // Text(widget.playlistName!, style: boldTextStyle(color: Colors.white, size: 24)),
                    4.height,
                    Text('Meditation', style: secondaryTextStyle()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
