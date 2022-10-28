import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MAWalkThroughBg extends StatefulWidget {
  @override
  _MAWalkThroughBgState createState() => _MAWalkThroughBgState();
}

class _MAWalkThroughBgState extends State<MAWalkThroughBg> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ClippedPartsWidget(
        top: Container(color: primaryColor.withOpacity(0.4)),
        bottom: Container(color: context.cardColor),
        splitFunction: (Size size, double x) {
          final normalizedX = x / size.width * 2 * pi;
          final waveHeight = size.height / 28;
          final y = size.height / 1.8 - sin(normalizedX) * waveHeight;
          return y;
        },
      ),
    );
  }
}

class ClippedPartsWidget extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final double Function(Size, double) splitFunction;

  ClippedPartsWidget({
    required this.top,
    required this.bottom,
    required this.splitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        top,
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: FunctionClipper(splitFunction: splitFunction),
            child: bottom,
          ),
        ),
      ],
    );
  }
}

class FunctionClipper extends CustomClipper<Path> {
  final double Function(Size, double) splitFunction;

  FunctionClipper({required this.splitFunction}) : super();

  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, splitFunction(size, 0));

    for (double x = 1; x <= size.width; x++) {
      path.lineTo(x, splitFunction(size, x));
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
