import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MABottomNavigationBar.dart';
import 'package:nb_utils/nb_utils.dart';

import '../fragment/MAHomeFragment.dart';
import '../fragment/MAMedicationFragment.dart';
import '../fragment/MAMusicFragment.dart';
import '../fragment/MAProfileFragment.dart';
import '../fragment/MASleepFragment.dart';

class MADashboardScreen extends StatefulWidget {
  @override
  _MADashboardScreenState createState() => _MADashboardScreenState();
}

class _MADashboardScreenState extends State<MADashboardScreen> {
  List<Widget> tab = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    tab = [
      MAHomeFragment(),
      MASleepFragment(),
      MAMedicationFragment(),
      MAMusicFragment(),
      MAProfileFragment(),
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          tab[_currentIndex],
          Container(
            height: 100,
            color: Colors.transparent,
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: primaryColor,
              initialIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                Icon(Icons.home_filled, color: whiteColor),
                Icon(Icons.nights_stay, color: whiteColor),
                Icon(Icons.local_florist_outlined, color: whiteColor),
                Icon(Icons.music_note_outlined, color: whiteColor),
                Icon(Icons.person, color: whiteColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
