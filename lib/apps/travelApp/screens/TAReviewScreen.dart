import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/component/TAAllReviewsComponent.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class TAReviewScreen extends StatefulWidget {
  @override
  TAReviewScreenState createState() => TAReviewScreenState();
}

class TAReviewScreenState extends State<TAReviewScreen> {
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

  taFormBottomSheet(BuildContext aContext) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: aContext,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: appStore.isDarkModeOn ? appStore.cardColor : Colors.white,
          ),
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Add Review", style: boldTextStyle()),
                Divider(
                  color: appStore.isDarkModeOn ? appStore.cardColor : Colors.white,
                ).paddingOnly(top: 16, bottom: 16),
                8.height,
                AppTextField(
                  textFieldType: TextFieldType.MULTILINE,
                  maxLines: 10,
                  decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Write a review..."),
                ),
                8.height,
                RatingBar(
                  initialRating: 5,
                  minRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ).center(),
                30.height,
                AppButton(
                  width: context.width(),
                  text: "Submit",
                  textStyle: primaryTextStyle(color: Colors.white),
                  color: TAColorPrimary,
                  onTap: () {
                    finish(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Reviews',
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  taFormBottomSheet(context);
                },
                child: Container(
                  decoration: boxDecorationWithShadow(spreadRadius: 2, borderRadius: radius(4), backgroundColor: TAColorPrimary),
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  width: context.width() / 2,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, size: 16, color: Colors.white),
                      4.width,
                      Text(
                        'Write a review',
                        style: primaryTextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TAAllReviewsComponent().paddingSymmetric(vertical: 16),
          ],
        ),
      ),
    );
  }
}
