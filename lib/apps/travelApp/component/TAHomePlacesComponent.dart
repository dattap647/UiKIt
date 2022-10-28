import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAFlightDetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/TAColors.dart';
import '../utils/TADataProvider.dart';

class TAHomePlacesComponent extends StatefulWidget {
  @override
  TAHomePlacesComponentState createState() => TAHomePlacesComponentState();
}

class TAHomePlacesComponentState extends State<TAHomePlacesComponent> {
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
    return HorizontalList(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        spacing: 16,
        itemCount: dashboardPlacesList.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: boxDecorationWithShadow(borderRadius: radius(taDefaultRadius.toDouble()), backgroundColor: appStore.cardColor, blurRadius: 1, spreadRadius: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                taCachedImage(dashboardPlacesList[i].img.validate(), height: 170, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topRight: taDefaultRadius, topLeft: taDefaultRadius),
                16.height,
                SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ORD', style: secondaryTextStyle(size: 12)),
                      Text('- - - -', style: secondaryTextStyle(size: 12)),
                      Icon(Ionicons.ios_airplane, size: 12),
                      Text('- - - -', style: secondaryTextStyle(size: 12)),
                      Text('NYC', style: secondaryTextStyle(size: 12))
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ),
                8.height,
                Text(dashboardPlacesList[i].title.validate(), style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
                Text('2020 june 20th', style: secondaryTextStyle(size: 12)).paddingSymmetric(horizontal: 16),
                AppButton(
                  padding: EdgeInsets.zero,
                  height: 20,
                  width: 50,
                  color: TAColorSecondary,
                  elevation: 0,
                  text: 'view',
                  textStyle: secondaryTextStyle(color: TAColorPrimary),
                  onTap: () {
                    //
                    TAFlightDetailScreen().launch(context);
                  },
                ).paddingAll(16)
              ],
            ),
          ).onTap(() {
            TAFlightDetailScreen().launch(context);
          });
        });
  }
}
