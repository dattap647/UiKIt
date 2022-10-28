import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASelectPaymentMethodScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAFlightSheetSelectionScreen extends StatefulWidget {
  @override
  TAFlightSheetSelectionScreenState createState() => TAFlightSheetSelectionScreenState();
}

class TAFlightSheetSelectionScreenState extends State<TAFlightSheetSelectionScreen> {
  List selectedSheets = [];

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
      appBar: appBarWidget('', backWidget: taBackButton(context, iconColor: context.iconColor), color: context.scaffoldBackgroundColor, elevation: 0),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: context.height(),
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                  crossAxisCount: 7,
                  children: List.generate(sheetsList.length, (index) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (selectedSheets.contains(index)) {
                                selectedSheets.remove(index);
                              } else {
                                selectedSheets.add(index);
                              }
                              setState(() {});
                            },
                            child: Stack(
                              children: [
                                sheetsList[index].fit().paddingAll(2),
                                if (selectedSheets.contains(index))
                                  Container(
                                    decoration: boxDecorationWithRoundedCorners(backgroundColor: TAColorSecondary.withOpacity(0.8), borderRadius: radius(12)),
                                    height: 50,
                                    width: 40,
                                  ).fit().paddingAll(2),
                              ],
                            )),
                      ],
                    );
                  })).paddingSymmetric(horizontal: 16, vertical: 8),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: boxDecorationWithShadow(
                  backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.white,
                  borderRadius: radius(12),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NewYork Weekend Trip ', style: primaryTextStyle()),
                    8.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('ORD', style: secondaryTextStyle(size: 14)),
                        8.width,
                        Icon(Ionicons.ios_airplane, size: 14),
                        8.width,
                        Text('NYC', style: secondaryTextStyle(size: 14)).expand(),
                        Text('3.50 Hr', style: boldTextStyle()),
                      ],
                    ),
                  ],
                ),
              ),
              AppButton(
                width: context.width(),
                textStyle: primaryTextStyle(color: Colors.white),
                color: TAColorPrimary,
                text: 'Continue',
                onTap: () {
                  TASelectPaymentMethodScreen().launch(context);
                },
              ).paddingAll(16),
            ],
          ),
        ],
      ),
    );
  }
}
