// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAAccountInfoScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAPlayListScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAReminderScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MASignInScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/MAAboutUsScreen.dart';
import '../screens/MAChangePassword.dart';
import '../screens/MAEditProfileScreen.dart';
import '../utils/MADataProvider.dart';

class MAProfileFragment extends StatefulWidget {
  @override
  _MAProfileFragmentState createState() => _MAProfileFragmentState();
}

class _MAProfileFragmentState extends State<MAProfileFragment> {
  bool isDND = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            right: 12, left: 12, bottom: 96, top: context.statusBarHeight + 4),
        child: Column(
          children: [
            16.height,
            Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(3),
                    decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        backgroundColor: primaryColor),
                    child: CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: AssetImage(MAProfile_image))),
                Positioned(
                  bottom: 4,
                  right: 3,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      backgroundColor: primaryColor,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Icon(Icons.edit, color: Colors.white, size: 16),
                  ).onTap(() async {
                    MAEditProfileScreen().launch(context);
                  }),
                )
              ],
            ).onTap(() {
              //
            }),
            16.height,
            Text('John Dover', style: boldTextStyle(size: 20)),
            4.height,
            Text('john@gmail.com', style: secondaryTextStyle(size: 16)),
            24.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                  spreadRadius: 0,
                  borderRadius: radius(12),
                  backgroundColor: context.cardColor),
              child: Column(
                children: [
                  SettingItemWidget(
                    titleTextStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                    title: "Account Info",
                    width: context.width(),
                    leading: Icon(FontAwesome.user_o,
                        color: textPrimaryColorGlobal, size: 20),
                    onTap: () {
                      MAAccountInfoScreen().launch(context);
                    },
                  ),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                    titleTextStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                    title: "Change Password",
                    width: context.width(),
                    leading: Icon(Ionicons.md_key_outline,
                        color: textPrimaryColorGlobal),
                    onTap: () {
                      MAChangePassword().launch(context,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                  ),
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                spreadRadius: 0,
                borderRadius: radius(12),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                children: [
                  SettingItemWidget(
                    titleTextStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                    title: "Favourite",
                    width: context.width(),
                    leading: Icon(MaterialIcons.favorite_border,
                        color: textPrimaryColorGlobal),
                    onTap: () {
                      MAPlayListScreen(
                              screenName: 'My Favourite', playlist: favList)
                          .launch(context,
                              pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                  ),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                    titleTextStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                    title: "Meditation Reminders",
                    width: context.width(),
                    leading: Icon(MaterialCommunityIcons.alarm,
                        color: textPrimaryColorGlobal),
                    onTap: () {
                      MAReminderScreen().launch(context);
                    },
                  ),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                    titleTextStyle: primaryTextStyle(),
                    padding: EdgeInsets.all(8),
                    title: "Do not Disturb",
                    width: context.width(),
                    trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: primaryColor,
                        value: isDND,
                        onChanged: (v) {
                          isDND = !isDND;
                          setState(() {});
                          if (isDND)
                            toast('Do not disturb mode turn on');
                          else
                            toast('Do not disturb mode turn on');
                        },
                      ).withHeight(10),
                    ),
                    leading: Icon(MaterialIcons.dnd_forwardslash,
                        color: textPrimaryColorGlobal),
                  ),
                  // Divider(color: viewLineColor),
                  // SettingItemWidget(
                  //     titleTextStyle: primaryTextStyle(),
                  //     padding: EdgeInsets.all(8),
                  //     title: "Night Mode",
                  //     width: context.width(),
                  //     leading: Icon(MaterialCommunityIcons.theme_light_dark, color: textPrimaryColorGlobal),
                  //     onTap: () async {
                  //       await showDialog(
                  //         context: context,
                  //         builder: (context) => MAThemeSelectionDaiLog(context),
                  //       );
                  //     }),
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                  spreadRadius: 0,
                  borderRadius: radius(12),
                  backgroundColor: context.cardColor),
              child: Column(
                children: [
                  SettingItemWidget(
                      titleTextStyle: primaryTextStyle(),
                      padding: EdgeInsets.all(8),
                      title: "About us",
                      width: context.width(),
                      leading: Icon(MaterialCommunityIcons.information_outline,
                          color: textPrimaryColorGlobal),
                      onTap: () async {
                        MAAboutUsScreen().launch(context,
                            pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                      titleTextStyle: primaryTextStyle(),
                      padding: EdgeInsets.all(8),
                      title: "Privacy Policy",
                      width: context.width(),
                      leading: Icon(Ionicons.ios_newspaper_outline,
                          color: textPrimaryColorGlobal),
                      onTap: () async {
                        launch('https://www.google.com/');
                      }),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                      titleTextStyle: primaryTextStyle(),
                      padding: EdgeInsets.all(8),
                      title: "Terms & Condition",
                      width: context.width(),
                      leading: Icon(Ionicons.ios_newspaper_outline,
                          color: textPrimaryColorGlobal),
                      onTap: () async {
                        launch('https://www.google.com/');
                      }),
                  Divider(color: viewLineColor),
                  SettingItemWidget(
                      titleTextStyle: primaryTextStyle(),
                      padding: EdgeInsets.all(8),
                      title: "Login",
                      width: context.width(),
                      leading:
                          Icon(AntDesign.login, color: textPrimaryColorGlobal),
                      onTap: () async {
                        MASignInScreen().launch(context,
                            pageRouteAnimation: PageRouteAnimation.Slide);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
