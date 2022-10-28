import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import '../screens/MASelectSceneScreen.dart';
import '../utils/MADataProvider.dart';
import 'MADailyCalmExersiceWidget.dart';

class AllMeditationComponent extends StatefulWidget {
  @override
  AllMeditationComponentState createState() => AllMeditationComponentState();
}

class AllMeditationComponentState extends State<AllMeditationComponent> {
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
    Widget albumWidget({String? img, String? title, double? height, BuildContext? context, String? heroTag}) {
      return Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Hero(
            tag: heroTag!,
            child: Image.asset(img!, height: height, width: context!.width() / 2 - 24, fit: BoxFit.cover).cornerRadiusWithClipRRect(12),
          ),
          Container(
              height: height,
              width: context.width() / 2 - 24,
              decoration:
                  boxDecorationWithRoundedCorners(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [transparentColor, transparentColor,transparentColor, Colors.black]))),
          Text(title!, maxLines: 2, style: boldTextStyle(size: 18, color: whiteColor)).paddingAll(12),
        ],
      ).onTap(() {
        MASelectSceneScreen(heroTag: heroTag, meditationName: title, bgImg: img).launch(context);
      });
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          DailyCalmExerciseWidget(),
          AnimationLimiter(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(meditationList.length, (index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2,
                  duration: Duration(milliseconds: 600),
                  child: FlipAnimation(
                    duration: Duration(milliseconds: 600),
                    flipAxis: FlipAxis.y,
                    child: albumWidget(
                        heroTag: '${meditationList[index].name}${index.toString()}',
                        img: meditationList[index].img,
                        title: meditationList[index].name,
                        height: meditationList[index].height,
                        context: context),
                  ),
                );
              }),
            ),
          ),
        ],
      ).paddingOnly(bottom: 80),
    );
  }
}
