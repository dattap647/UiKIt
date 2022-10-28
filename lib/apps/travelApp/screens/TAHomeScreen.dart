import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAAdventureWrapList.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAHomePlacesComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAPopularCategoryComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAViewAllScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class TAHomeScreen extends StatefulWidget {
  static String tag = '/TAHomeScreen';

  @override
  TAHomeScreenState createState() => TAHomeScreenState();
}

class TAHomeScreenState extends State<TAHomeScreen> {
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
        padding: EdgeInsets.only(top: context.statusBarHeight+8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hey John,', style: boldTextStyle(size: 24)).paddingSymmetric(horizontal: 16),
            Text('check your trips', style: boldTextStyle(size: 24)).paddingSymmetric(horizontal: 16),
            8.height,
            Text('View trip detail or add new trip', style: secondaryTextStyle(size: 14)).paddingSymmetric(horizontal: 16),
            16.height,
            TAHomePlacesComponent(),
            16.height,
            Text('Popular Category', style: boldTextStyle()).paddingSymmetric(horizontal: 16),
            8.height,
            TAPopularCategoryComponent(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best Destinations', style: boldTextStyle()),
                GestureDetector(
                  onTap: () {
                    TAViewAllScreen(title: 'Best Destination').launch(context);
                  },
                  child: Text('View all', style: secondaryTextStyle()),
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            TAAdventureWrapList().paddingAll(16),
          ],
        ),
      ),
    );
  }
}
