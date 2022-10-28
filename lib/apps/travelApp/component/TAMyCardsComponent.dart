import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAAddNewCardScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAMyCardsComponent extends StatefulWidget {
  @override
  TAMyCardsComponentState createState() => TAMyCardsComponentState();
}

class TAMyCardsComponentState extends State<TAMyCardsComponent> {
  int selectedIndex = -1;

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
    return Stack(
      children: [
        Column(
            children: List.generate(myCardsList.length, (index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithShadow(
                  borderRadius: radius(taDefaultRadius.toDouble()), blurRadius: 2, spreadRadius: 1, backgroundColor: selectedIndex == index ? TAColorSecondary.withOpacity(0.5) : appStore.cardColor),
              child: Row(
                children: [
                  taCachedImage(myCardsList[index].img.validate(), width: 60, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(taDefaultRadius.toDouble()),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(myCardsList[index].title.validate(), style: boldTextStyle()), Text(myCardsList[index].subtitle.validate(), style: secondaryTextStyle())],
                  )
                ],
              ),
            ),
          );
        })).paddingTop(80),
        GestureDetector(
          onTap: () {
            TAAddNewCardScreen().launch(context);
          },
          child: Container(
            decoration: boxDecorationWithShadow(
              borderRadius: radius(12),
              backgroundColor: appStore.cardColor,
              spreadRadius: 1,
              blurRadius: 2,
            ),
            // margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [Icon(Icons.credit_card_outlined), 8.width, Text('Add a new card', style: primaryTextStyle()).expand(), Icon(Icons.arrow_forward_ios, color: context.iconColor)],
            ),
          ),
        ),
      ],
    );
  }
}
