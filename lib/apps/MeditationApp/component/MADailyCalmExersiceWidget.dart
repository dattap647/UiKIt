import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/screens/MAExersiceScreen.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class DailyCalmExerciseWidget extends StatefulWidget {
  @override
  DailyCalmExerciseWidgetState createState() => DailyCalmExerciseWidgetState();
}

class DailyCalmExerciseWidgetState extends State<DailyCalmExerciseWidget> {
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
      onTap: () {
        MAExerciseScreen(
          exerciseGif: "images/meditationApp/breath_in_out_gif.gif",
          exerciseTitle: "Breath",
          exerciseMsg: "A 5 min into intro to meditation . Relax and start to Breath In - Breath Out",
          doExercise: true,
          exerciseAudio: 'Images/sample.mp3',
        ).launch(context);
      },
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(decorationImage: DecorationImage(image: AssetImage(MABg1), fit: BoxFit.cover), borderRadius: radius(12), backgroundColor: Colors.grey.withOpacity(0.2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Calm', maxLines: 2, style: boldTextStyle(size: 18,color: Colors.white)),
                8.height,
                Text('Feb 28 : PAUSE PURCHASE', maxLines: 2, style: secondaryTextStyle(size: 12,color: Colors.white)),
              ],
            ),
            Icon(Icons.play_circle_fill, size: 34)
          ],
        ),
      ),
    );
  }
}
