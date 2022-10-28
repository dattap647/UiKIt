import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/model/TABottomNavigationList.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAExploreScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAHomeScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAProfileScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TATripsScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TADashboardScreen extends StatefulWidget {
  static String tag = '/TADashboardScreen';

  @override
  TADashboardScreenState createState() => TADashboardScreenState();
}

class TADashboardScreenState extends State<TADashboardScreen> {
  int currentIndex = 0;
  Color bottomTabColor = iconColorSecondary;

  static List<Widget> widgets = <Widget>[
    TAHomeScreen(),
    TAExploreScreen(),
    TATripsScreen(),
    TAProfileScreen(),
  ];
  List<TABottomNavigationList> taBottomNavigationList = [
    TABottomNavigationList(iconData: MaterialCommunityIcons.home, label: 'Home'),
    TABottomNavigationList(iconData: Ionicons.ios_paper_plane, label: 'Explore'),
    TABottomNavigationList(iconData: Icons.flight, label: 'My Trip'),
    TABottomNavigationList(iconData: Icons.account_circle, label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    bottomTabColor = appStore.isDarkModeOn ? Colors.white : iconColorSecondary;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: List.generate(taBottomNavigationList.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              taBottomNavigationList[index].iconData,
              color: currentIndex == index ? TAColorPrimary : bottomTabColor,
              size: 22,
            ),
            label: taBottomNavigationList[index].label,
          );
        }),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: context.iconColor,
        backgroundColor: context.cardColor,
        selectedLabelStyle: secondaryTextStyle(color: TAColorPrimary, size: 12),
        unselectedLabelStyle: secondaryTextStyle(color: TAColorSecondary, size: 12),
        showUnselectedLabels: true,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
