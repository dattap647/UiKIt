import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADetailScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class TAAdventureWrapList extends StatefulWidget {
  @override
  TAAdventureWrapListState createState() => TAAdventureWrapListState();
}

class TAAdventureWrapListState extends State<TAAdventureWrapList> {
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
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: adventureList.map((e) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: context.width() / 2 - 24,
              height: e.taHeight,
              decoration: BoxDecoration(color: TAColorSecondary, borderRadius: radius(12)),
              child: cachedImage(e.img.validate(), fit: BoxFit.cover, width: context.width() / 2 - 24, radius: 12),
            ).onTap(() {
              TADetailScreen().launch(context);
            }),
            Text(e.title!, style: boldTextStyle(color: Colors.white, size: 20)),
          ],
        );
      }).toList(),
    );
  }
}
