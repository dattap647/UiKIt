import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/TADataProvider.dart';

class TAPopularCategoryComponent extends StatefulWidget {
  @override
  TAPopularCategoryComponentState createState() => TAPopularCategoryComponentState();
}

class TAPopularCategoryComponentState extends State<TAPopularCategoryComponent> {
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
        itemCount: categoryList.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, i) {
          return Column(
            children: [
              taCachedImage(categoryList[i].img.validate(), height: 70, width: 70, fit: BoxFit.cover).cornerRadiusWithClipRRect(35),
              16.height,
              Text(categoryList[i].title.validate(), style: secondaryTextStyle(color: context.iconColor)),
            ],
          ).onTap(() {
            TAViewAllScreen(title: 'Popular').launch(context);
          });
        });
  }
}
