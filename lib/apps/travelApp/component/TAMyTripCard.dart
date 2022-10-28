import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAMyTripCard extends StatefulWidget {
  final String? name;
  final String? locationName;

  TAMyTripCard({this.name, this.locationName});

  @override
  TAMyTripCardState createState() => TAMyTripCardState();
}

class TAMyTripCardState extends State<TAMyTripCard> {
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: boxDecorationWithShadow(backgroundColor: appStore.cardColor, borderRadius: radius(12), spreadRadius: 1, blurRadius: 2),
      child: Row(
        children: [
          Container(
            decoration: boxDecorationWithRoundedCorners(backgroundColor: TAColorPrimary, borderRadius: radius(35)),
            height: 70,
            width: 70,
            padding: EdgeInsets.all(2),
            child: Icon(Ionicons.ios_paper_plane, color: Colors.white, size: 24),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.location_on_outlined, color: context.iconColor, size: 18),
                  Text(widget.locationName.validate(), style: secondaryTextStyle()),
                  16.width,
                  Text('\$250', style: primaryTextStyle()),
                ],
              ),
              8.height,
              Text(widget.name.validate(), style: boldTextStyle()),
              8.height,
              Text('Mar 12- April 12', style: primaryTextStyle(size: 14))
            ],
          )
        ],
      ),
    );
  }
}
