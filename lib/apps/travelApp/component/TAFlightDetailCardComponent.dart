import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TAFlightDetailCard extends StatefulWidget {
  @override
  TAFlightDetailCardState createState() => TAFlightDetailCardState();
}

class TAFlightDetailCardState extends State<TAFlightDetailCard> {
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ORD', style: secondaryTextStyle(size: 12)),
            Text('- - - -', style: secondaryTextStyle(size: 12)),
            Column(
              children: [
                Icon(Ionicons.ios_airplane, size: 12),
                Text('3.50 Hr', style: secondaryTextStyle(size: 12)),
              ],
            ),
            Text('- - - -', style: secondaryTextStyle(size: 12)),
            Text('NYC', style: secondaryTextStyle(size: 12))
          ],
        ),
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('6.10 AM', style: primaryTextStyle()),
            Text('9.25 AM', style: primaryTextStyle()),
          ],
        ),
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$201', style: boldTextStyle()),
            AppButton(
              padding: EdgeInsets.zero,
              height: 20,
              width: 60,
              color: TAColorSecondary,
              elevation: 0,
              text: 'Details',
              textStyle: secondaryTextStyle(color: TAColorPrimary),
              onTap: () {
                //
                //
              },
            )
          ],
        )
      ],
    );
  }
}
