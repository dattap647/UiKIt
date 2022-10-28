import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAAudioPlayerScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAFeaturedPlaylistScreem.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAMusicViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MASearchScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../component/MAMusicListComponent.dart';
import '../screens/MAPlayListScreen.dart';
import '../utils/MADataProvider.dart';

class MAMusicFragment extends StatefulWidget {
  @override
  MAMusicFragmentState createState() => MAMusicFragmentState();
}

class MAMusicFragmentState extends State<MAMusicFragment> {
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

      appBar: appBarWidget(
        'Music',
        showBack: false,
        elevation: 0,
        color: context.scaffoldBackgroundColor,
        bottom: PreferredSize(
          preferredSize: Size(context.width(), 80),
          child: Column(
            children: [
              16.height,
              Container(
                padding: EdgeInsets.all(16),
                decoration: boxDecorationWithShadow(
                  backgroundColor: appStore.isDarkModeOn ? Colors.black.withOpacity(0.2) : Colors.grey.shade100,
                  blurRadius: 1,
                  borderRadius: radius(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.favorite_border, color: primaryColor, size: 24),
                        4.height,
                        Text('My Favourite', style: primaryTextStyle(size: 14)),
                      ],
                    ).onTap(() {
                      MAPlayListScreen(screenName: 'My Favourite', playlist: favList).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    }),
                    Column(
                      children: [
                        Icon(MaterialCommunityIcons.download_box_outline, color: primaryColor, size: 24),
                        4.height,
                        Text('My Offline', style: primaryTextStyle(size: 14)),
                      ],
                    ).onTap(() {
                      MAPlayListScreen(screenName: 'My Offline', playlist: offLineList).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    }),
                  ],
                ),
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
        ),
        actions: [
          GestureDetector(
              onTap: (){
                MASearchScreen().launch(context);
              },
              child: Hero(tag: 'search', child: Icon(Icons.search_rounded, color: context.iconColor)).paddingRight(16))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: musicFeaturedList.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 16, top: 16),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: 200.milliseconds,
                    duration: Duration(milliseconds: 600),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            MAAudioPlayScreen(
                              url: 'images/meditationApp/sample.mp3',
                              bgImage: musicFeaturedList[index].img!,
                              audioName: 'Relax',
                            ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 150,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 16, bottom: 20),
                                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: secondaryColor),
                                      child: Image.asset(musicFeaturedList[index].img!, width: context.width(), height: context.height(), fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('title', style: boldTextStyle(color: Colors.white)),
                                        8.height,
                                        Text('24 minute', style: secondaryTextStyle(color: Colors.white.withOpacity(0.8))),
                                        8.height,
                                      ],
                                    ).paddingSymmetric(horizontal: 8, vertical: 16),
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                        decoration: boxDecorationWithRoundedCorners(borderRadius: radius(4), backgroundColor: Colors.blue),
                                        child: Text('Sleep', style: secondaryTextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(bottom: 10, right: 32, child: Icon(Icons.play_circle_fill, size: 28, color: context.iconColor))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text('Featured Playlist', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: musicFeaturedList.length,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: 200.milliseconds,
                    duration: Duration(milliseconds: 600),
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: secondaryColor),
                                child: Hero(
                                    tag: musicFeaturedList[index].text!,
                                    child: Image.asset(musicFeaturedList[index].img!, width: context.width(), height: context.height(), fit: BoxFit.cover).cornerRadiusWithClipRRect(12)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(musicFeaturedList[index].text!, style: boldTextStyle(color: Colors.white)),
                                  8.height,
                                  Text('24 minute', style: secondaryTextStyle(color: Colors.white.withOpacity(0.8))),
                                ],
                              ).paddingSymmetric(horizontal: 8, vertical: 16),
                              Positioned(top: 16, left: 16, child: Icon(Icons.playlist_play_outlined, color: Colors.white, size: 24))
                            ],
                          ).onTap(() {
                            MAFeaturedPlaylistScreen(playlistName: musicFeaturedList[index].text!, bgImg: musicFeaturedList[index].img!).launch(context);
                          }),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Track', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
                Text('View all', style: secondaryTextStyle(color: primaryColor)).paddingSymmetric(horizontal: 16).onTap(() {
                  MAMusicViewAllScreen().launch(context);
                }),
              ],
            ),
            MusicListComponent()
          ],
        ),
      ),
    );
  }
}
