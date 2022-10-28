import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../component/MAAllMeditationComponent.dart';
import '../models/MAMeditationTopic.dart';

const double borderRadius = 25.0;

class MAMedicationFragment extends StatefulWidget {
  @override
  MAMedicationFragmentState createState() => MAMedicationFragmentState();
}

class MAMedicationFragmentState extends State<MAMedicationFragment> with SingleTickerProviderStateMixin {
  int activePageIndex = 0;
  late final Autocomplete textField;

  List<MAMeditationTopic> meditationTopicList = [
    MAMeditationTopic(name: 'Recent', icon: AntDesign.clockcircle),
    MAMeditationTopic(name: 'My', icon: Icons.favorite),
    MAMeditationTopic(name: 'anxiety', icon: MaterialCommunityIcons.emoticon_sad),
    MAMeditationTopic(name: 'Sleep', icon: Ionicons.md_cloudy_night),
    MAMeditationTopic(name: 'Kids', icon: MaterialCommunityIcons.account_child),
    MAMeditationTopic(name: 'Mindfulness', icon: MaterialCommunityIcons.emoticon),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            16.height,
            Text('Meditation', style: boldTextStyle(size: 20)).paddingSymmetric(horizontal: 16),
            8.height,
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Now is a great time to meditate', textStyle: primaryTextStyle(size: 12)),
              ],
              isRepeatingAnimation: false,
              onTap: () {
                print("Tap Event");
              },
            ).paddingSymmetric(horizontal: 16),
            16.height,
            DefaultTabController(
              length: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      indicatorColor: primaryColor,
                      indicator:BoxDecoration() ,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8),
                      onTap: (i) {
                        activePageIndex = i;
                        setState(() {});
                      },
                      tabs: List.generate(meditationTopicList.length, (index) {
                        return Tab(
                          child: Container(
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(12),
                              backgroundColor: index == activePageIndex
                                  ? primaryColor.withOpacity(0.1)
                                  : appStore.isDarkModeOn
                                      ? Colors.grey.shade400
                                      : Colors.grey.shade100,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(meditationTopicList[index].icon, color: index == activePageIndex ? primaryColor : Colors.black.withOpacity(0.7)),
                          ),
                        );
                      }),
                    ),
                  ),
                  16.height,
                  Container(
                    height: MediaQuery.of(context).size.height - 186,
                    child: TabBarView(
                      children: [
                        AllMeditationComponent(),
                        AllMeditationComponent(),
                        AllMeditationComponent(),
                        AllMeditationComponent(),
                        AllMeditationComponent(),
                        AllMeditationComponent(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingTop(context.statusBarHeight + 4),
      ),
    );
  }
}
