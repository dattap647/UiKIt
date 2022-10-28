import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAAdventureWrapList.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAPopularCategoryComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:nb_utils/nb_utils.dart';

class TAExploreScreen extends StatefulWidget {
  static String tag = '/TAExploreScreen';

  @override
  TAExploreScreenState createState() => TAExploreScreenState();
}

class TAExploreScreenState extends State<TAExploreScreen> {
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Type of tour', style: boldTextStyle()).paddingOnly(right: 16, left: 16, top: context.statusBarHeight + 80),
                8.height,
                TAPopularCategoryComponent(),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Adventure', style: boldTextStyle()),
                    GestureDetector(
                      onTap: () {
                        TAViewAllScreen(title: 'Best Adventure').launch(context);
                      },
                      child: Text('View all', style: secondaryTextStyle()),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16),
                TAAdventureWrapList().paddingAll(16),
              ],
            ),
          ),
          searchTextField(context: context, isReadOnly: true).paddingOnly(top: context.statusBarHeight+20, left: 16, right: 16, bottom: 16)
        ],
      ),
    );
  }
}
