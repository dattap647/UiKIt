import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class TAPhotosComponent extends StatefulWidget {
  @override
  TAPhotosComponentState createState() => TAPhotosComponentState();
}

class TAPhotosComponentState extends State<TAPhotosComponent> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Photos', style: boldTextStyle()),
        8.height,
        StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: placeImageList.map((e) {
            return taCachedImage(e.img.validate(), height: 100, width: context.width() / 3 - 16, fit: BoxFit.cover);
          }).toList(),
        )
      ],
    );
  }
}
