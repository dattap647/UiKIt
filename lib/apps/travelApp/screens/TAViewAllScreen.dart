import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class TAViewAllScreen extends StatefulWidget {
 final String? title;

  TAViewAllScreen({this.title});

  @override
  TAViewAllScreenState createState() => TAViewAllScreenState();
}

class TAViewAllScreenState extends State<TAViewAllScreen> {
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
        widget.title!,
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
            children: List.generate(taAllPlacesList.length, (index) {
          return GestureDetector(
            onTap: () {
              TADetailScreen().launch(context);
            },
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                cachedImage(taAllPlacesList[index].img!, height: 230, width: context.width(), radius: 12, fit: BoxFit.cover),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(taAllPlacesList[index].title!, style: boldTextStyle(color: Colors.white)),
                    Text(taAllPlacesList[index].day!, style: secondaryTextStyle(color: Colors.white)),
                    RatingBar(
                      initialRating: 5,
                      minRating: 1,
                      itemCount: 5,
                      glow: false,
                      maxRating: 5,
                      itemSize: 20,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        // ratingNum = rating.toInt();
                        // setState(() {});
                      },
                    ),
                  ],
                ).paddingAll(16),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Row(
                    children: [Icon(Icons.location_on_outlined, color: Colors.white, size: 18), Text(taAllPlacesList[index].subtitle!, style: secondaryTextStyle(color: Colors.white))],
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: GestureDetector(
                      onTap: (){
                        taAllPlacesList[index].isSelected=!taAllPlacesList[index].isSelected;
                        setState(() { });
                      },
                      child: Icon(Icons.bookmark, color: taAllPlacesList[index].isSelected ? TAColorPrimary : Colors.white, size: 30)),
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 8),
          );
        })),
      ),
    );
  }
}
