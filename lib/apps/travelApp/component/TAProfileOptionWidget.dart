import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class TAProfileOptionWidget extends StatefulWidget {
  final IconData? iconData;
  final String? optionTitle;
  final Function()? onTap;
  final double iconSize;

  TAProfileOptionWidget({this.iconData, this.optionTitle, this.onTap,this.iconSize=28});

  @override
  TAProfileOptionWidgetState createState() => TAProfileOptionWidgetState();
}

class TAProfileOptionWidgetState extends State<TAProfileOptionWidget> {
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
    return GestureDetector(
      onTap: () => widget.onTap!.call(),
      child: Container(
        margin: EdgeInsets.only(right: 16,left: 16,bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithShadow(borderRadius: radius(12),backgroundColor: appStore.cardColor,
        blurRadius: 2,spreadRadius: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                     Icon(widget.iconData, color:context.iconColor, size:widget.iconSize),
            8.width,
            Text(widget.optionTitle.validate(), style: primaryTextStyle()).expand(),
            Icon(Icons.arrow_forward_ios, color: context.iconColor, size: 16),
          ],
        ),
      ),
    );
  }
}
