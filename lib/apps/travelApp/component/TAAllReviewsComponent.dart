import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAAllReviewsComponent extends StatefulWidget {
  @override
  TAAllReviewsComponentState createState() => TAAllReviewsComponentState();
}

class TAAllReviewsComponentState extends State<TAAllReviewsComponent> {
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
    return Column(
      children: List.generate(reviewList.length, (index) {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewList[index].title.validate(),
                  style: boldTextStyle(),
                ),
                Text(
                  reviewList[index].subtitle.validate(),
                  style: secondaryTextStyle(size: 12),
                ),
                8.height,
                Text(
                  reviewList[index].desc.validate(),
                  style: primaryTextStyle(size: 14),
                ),
                8.height,
                if (index != reviewList.length - 1) Divider(thickness: 2, color: appStore.isDarkModeOn ? Colors.grey.shade800 : viewLineColor)
              ],
            ).paddingOnly(
              right: 16,
              left: 72,
              bottom: 8,
            ),
            Positioned(left: 16, child: taCachedImage(reviewList[index].img.validate(), width: 40, height: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(20)),
          ],
        );
      }),
    );
  }
}
