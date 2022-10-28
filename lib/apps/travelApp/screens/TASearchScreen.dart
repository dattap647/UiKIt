import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAAdventureWrapList.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:nb_utils/nb_utils.dart';

class TASearchScreen extends StatefulWidget {
  @override
  TASearchScreenState createState() => TASearchScreenState();
}

class TASearchScreenState extends State<TASearchScreen> {
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
            padding: EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Search', style: boldTextStyle(size: 20)),
                    Text('Clear', style: secondaryTextStyle()),
                  ],
                ),
                16.height,
                TAAdventureWrapList(),
              ],
            ),
          ),
          Row(
            children: [
              taBackButton(context, iconColor: context.iconColor),
              searchTextField(isReadOnly: false).expand(),
            ],
          ).paddingOnly(top: context.statusBarHeight+4, right: 16, bottom: 16),
        ],
      ),
    );
  }
}
