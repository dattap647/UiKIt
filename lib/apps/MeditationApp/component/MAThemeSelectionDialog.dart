import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppContants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class MAThemeSelectionDaiLog extends StatefulWidget {
  final BuildContext context;

  MAThemeSelectionDaiLog(this.context);

  @override
  MAThemeSelectionDaiLogState createState() => MAThemeSelectionDaiLogState();
}

class MAThemeSelectionDaiLogState extends State<MAThemeSelectionDaiLog> {
  List<String> themeModeList = ['Light mode', 'Dark mode', 'System Default'];
  int? currentIndex = 0;
  late BuildContext context;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    context = widget.context;
    currentIndex = sharedPreferences.getInt(THEME_MODE_INDEX);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: context.width(),
        padding: EdgeInsets.all(8),
        decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: context.cardColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Select App Theme', style: boldTextStyle(size: 18)).paddingLeft(16),
            16.height,
            ListView.builder(
              shrinkWrap: true,
              itemCount: themeModeList.length,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile(
                  value: index,
                  activeColor: primaryColor,
                  groupValue: currentIndex,
                  title: Text(themeModeList[index], style: primaryTextStyle()),
                  onChanged: (dynamic val) async {
                    currentIndex = val;
                    log(currentIndex.toString());

                    if (val == ThemeModeSystem) {
                      appStore.toggleDarkMode(value: context.platformBrightness() == Brightness.dark);
                      setState(() {});
                    } else if (val == ThemeModeLight) {
                      appStore.toggleDarkMode(value:false);
                      setState(() {});
                    } else if (val == ThemeModeDark) {
                      appStore.toggleDarkMode(value:true);
                      setState(() {});
                    }
                    sharedPreferences.setInt(THEME_MODE_INDEX, val);
                    setState(() {});

                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
