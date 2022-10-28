import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAFavouritesScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAProfileOptionWidget.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAAboutUsScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAEditProfileScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAMyCardScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TANotificationScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASigninScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class TAProfileScreen extends StatefulWidget {
  @override
  TAProfileScreenState createState() => TAProfileScreenState();
}

class TAProfileScreenState extends State<TAProfileScreen> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: context.statusBarHeight + 28, bottom: 16),
        child: Column(
          children: [
            GestureDetector(onTap: () => TAEditProfileScreen().launch(context), child: Image.asset(ta_profileImg, height: 75, width: 75, fit: BoxFit.cover).cornerRadiusWithClipRRect(50)),
            8.height,
            GestureDetector(
              onTap: () => TAEditProfileScreen().launch(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [24.width, Text('John Howkins', style: boldTextStyle(size: 22)), 8.width, Icon(MaterialIcons.edit, size: 20, color: context.iconColor)],
              ),
            ),
            8.height,
            Container(
              decoration: boxDecorationWithShadow(spreadRadius: 2, borderRadius: radius(4), backgroundColor: TAColorPrimary),
              padding: EdgeInsets.zero,
              height: 20,
              width: context.width() / 3,
              alignment: Alignment.center,
              // elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(MaterialCommunityIcons.crown_outline, size: 16, color: Colors.white),
                  4.width,
                  Text('VIP Member', style: primaryTextStyle(size: 12, color: Colors.white)),
                ],
              ),
            ),
            24.height,
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.bell_ring_outline,
              optionTitle: 'Notifications',
              onTap: () {
                TANotificationScreen().launch(context);
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.bookmark_multiple_outline,
              optionTitle: 'Favourites',
              onTap: () {
                TAFavouritesScreen().launch(context);
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.card_bulleted_outline,
              optionTitle: 'My Cards',
              onTap: () {
                TAMyCardScreen().launch(context);
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.file_check_outline,
              optionTitle: 'Terms & Condition',
              onTap: () {
                toast('Terms & Condition');
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.key_outline,
              optionTitle: 'Privacy policy',
              onTap: () {
                toast('Privacy policy');
              },
            ),
            TAProfileOptionWidget(
              iconData: Ionicons.help,
              optionTitle: 'Help Center',
              onTap: () {
                toast('Help Center');
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.information_outline,
              optionTitle: 'About Us',
              onTap: () {
                TAAboutUsScreen().launch(context);
              },
            ),
            TAProfileOptionWidget(
              iconData: MaterialCommunityIcons.logout,
              optionTitle: 'Logout',
              onTap: () {
                TASigninScreen().launch(context, isNewTask: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
