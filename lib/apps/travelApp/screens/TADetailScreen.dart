import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAFlightDetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAPhotosComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAReviewScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class TADetailScreen extends StatefulWidget {
  @override
  TADetailScreenState createState() => TADetailScreenState();
}

class TADetailScreenState extends State<TADetailScreen> {
  bool isAddToFav = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
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
          cachedImage(ta_travel6, height: 400, fit: BoxFit.cover, radius: 0),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 350),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.cardColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: context.iconColor, size: 18),
                      Text('America', style: secondaryTextStyle()),
                    ],
                  ),
                  8.height,
                  Text('Surf Lesson : Nyc miles', style: boldTextStyle(size: 22)),
                  8.height,
                  GestureDetector(
                    onTap: () {
                      TAReviewScreen().launch(context);
                    },
                    child: Row(
                      children: [
                        RatingBar(
                          initialRating: 5,
                          minRating: 1,
                          itemCount: 5,
                          glow: false,
                          maxRating: 5,
                          itemSize: 10,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            // ratingNum = rating.toInt();
                            // setState(() {});
                          },
                        ),
                        8.width,
                        Text(
                          '24 Reviews',
                          style: primaryTextStyle(size: 12),
                        )
                      ],
                    ),
                  ),
                  8.height,
                  Text(taLongText, style: primaryTextStyle(size: 14)),
                  8.height,
                  TAPhotosComponent(),
                  80.height,
                ],
              ).paddingAll(16),
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            top: context.statusBarHeight + 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                taBackButton(context, iconColor: Colors.white, iconSize: 24),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Share.share('check out my website https://www.google.com');
                      },
                      icon: Icon(MaterialIcons.share, color: Colors.white, size: 24),
                    ),
                    8.width,
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        isAddToFav = !isAddToFav;
                        setState(() {});
                      },
                      icon: Icon(isAddToFav ? Icons.bookmark : Icons.bookmark_border, color: Colors.white, size: 24),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: "Book a flight",
              textStyle: primaryTextStyle(color: Colors.white),
              color: TAColorPrimary,
              onTap: () {
                TAFlightDetailScreen().launch(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
