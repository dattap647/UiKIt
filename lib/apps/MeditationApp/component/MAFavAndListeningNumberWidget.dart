import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class FavAndListeningNumberWidget extends StatefulWidget {
  final Color? color;

  FavAndListeningNumberWidget(this.color);

  @override
  FavAndListeningNumberWidgetState createState() => FavAndListeningNumberWidgetState();
}

class FavAndListeningNumberWidgetState extends State<FavAndListeningNumberWidget> {
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(Icons.favorite, size: 16, color:widget.color),
            8.width,
            Text('24234 Favourites', style: boldTextStyle(size: 14, color:widget.color)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.headset, size: 16, color:widget.color),
            8.width,
            Text('34.234 Listening', style: boldTextStyle(size: 14, color:widget.color)),
          ],
        ),
      ],
    );
  }
}
