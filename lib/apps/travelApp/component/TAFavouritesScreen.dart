import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:mighty_ui_kit/apps/travelApp/screens/TADetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';

class TAFavouritesScreen extends StatefulWidget {
  @override
  TAFavouritesScreenState createState() => TAFavouritesScreenState();
}

class TAFavouritesScreenState extends State<TAFavouritesScreen> {
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
      appBar: appBarWidget(
        'Favourites',
        elevation: 0,
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(adventureList.length, (index) {
          return Container(
            width: context.width(),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: boxDecorationWithShadow(backgroundColor: appStore.cardColor, borderRadius: radius(12), spreadRadius: 1, blurRadius: 2),
            child: GestureDetector(
              onTap: () {
                TADetailScreen().launch(context);
              },
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Row(
                    children: [
                      taCachedImage(adventureList[index].img.validate(), width: 75, height: 75, fit: BoxFit.cover).cornerRadiusWithClipRRect(taDefaultRadius.toDouble()),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(adventureList[index].title.validate(), style: boldTextStyle()),
                          8.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(Icons.location_on_outlined, color: context.iconColor, size: 18), Text('America', style: secondaryTextStyle())],
                          ),
                          4.height,
                          Row(
                            children: [
                              RatingBar(
                                initialRating: 5,
                                minRating: 1,
                                itemCount: 5,
                                glow: false,
                                maxRating: 5,
                                itemSize: 14,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) {},
                              ),
                              8.width,
                              Text(
                                '24 Reviews',
                                style: primaryTextStyle(size: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(adventureList[index].isSelected ? Icons.bookmark : Icons.bookmark_border, color: TAColorPrimary).onTap(() {
                    adventureList[index].isSelected = !adventureList[index].isSelected;
                    setState(() {});
                  })
                ],
              ),
            ),
          );
        })).paddingSymmetric(vertical: 8),
      ),
    );
  }
}
