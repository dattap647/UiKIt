import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAPopularHorizontalList extends StatefulWidget {
  @override
  TAPopularHorizontalListState createState() => TAPopularHorizontalListState();
}

class TAPopularHorizontalListState extends State<TAPopularHorizontalList> {
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
        spacing: 16,
        itemCount: popularList.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: boxDecorationWithShadow(borderRadius: radius(taDefaultRadius.toDouble()), backgroundColor: appStore.cardColor, blurRadius: 2),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                taCachedImage(popularList[i].img.validate(), height: 170, width: 200, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topRight: taDefaultRadius, topLeft: taDefaultRadius),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularList[i].title.validate(),
                      style: boldTextStyle(size: 20, color: Colors.white),
                    ),
                    4.height,
                    Text(
                      popularList[i].subtitle.validate(),
                      style: secondaryTextStyle(color: Colors.white),
                    ),
                  ],
                ).paddingAll(16)
              ],
            ),
          ).onTap(() {
            TADetailScreen().launch(context);
          });
        });
  }
}
