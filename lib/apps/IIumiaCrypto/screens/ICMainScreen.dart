import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICHomeScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICMenuScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICNewsScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICWatchListScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICMainScreen extends StatefulWidget {
  @override
  _ICMainScreenState createState() => _ICMainScreenState();
}

class _ICMainScreenState extends State<ICMainScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    ICHomeScreen(),
    ICDashboardScreen(),
    ICWatchListScreen(),
    ICNewsScreen(),
    ICMenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: icScaffoldBgColor,
      body: tabs.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: icScaffoldBgColor,
        elevation: 4,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.broken_image_outlined, color: icWhiteColor),
            activeIcon: Column(
              children: [
                Icon(Icons.broken_image_outlined),
                2.height,
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(color: icSkip, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined, color: icWhiteColor),
            activeIcon: Column(
              children: [
                Icon(Icons.file_copy_outlined),
                2.height,
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(color: icSkip, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(borderRadius: radius(8), color: Colors.blue),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.favorite_outline, color: icWhiteColor),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(borderRadius: radius(8), color: Colors.blue),
              padding: EdgeInsets.all(8),
              child: Icon(Icons.favorite_outline, color: icWhiteColor),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.messenger_outline, color: icWhiteColor),
            activeIcon: Column(
              children: [
                Icon(Icons.messenger_outline),
                2.height,
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(color: icSkip, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: icWhiteColor),
            activeIcon: Column(
              children: [
                Icon(Icons.menu),
                2.height,
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(color: icSkip, borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            label: "",
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: icSkip,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
