import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppContants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MAAboutUsScreen extends StatefulWidget {
  @override
  _MAAboutUsScreenState createState() => _MAAboutUsScreenState();
}

class _MAAboutUsScreenState extends State<MAAboutUsScreen> {
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
      appBar: appBarWidget("About Us", elevation: 0, color: primaryColor, textColor: Colors.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(appName, style: boldTextStyle(size: 20)),
          16.height,
          Container(decoration: BoxDecoration(color: primaryColor, borderRadius: radius(4)), height: 4, width: 100),
          16.height,
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (_, snap) {
              if (snap.hasData) {
                return Text('V ${snap.data!.version}', style: primaryTextStyle());
              }
              return SizedBox();
            },
          ),
          16.height,
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                  'Meditation can certainly help relax you when you’re stressed, but that’s just one of its benefits. With regular practice, you can learn to shut out the noise of modern life and be present without having to take a trip to a remote tropical island. While there are plenty of guided meditations on YouTube, meditation apps streamline the process, helping you achieve new levels of meditation prowess',
                  textStyle: primaryTextStyle(size: 14),
                  speed: Duration(milliseconds: 100),
                  textAlign: TextAlign.start),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 100),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          16.height,
          SizedBox(height: 16, width: context.width())

          // AppButton(
          //   color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Image.asset('assets/purchase.png', height: 24, color: white),
          //       8.width,
          //       Text('Purchase', style: boldTextStyle(color: white)),
          //     ],
          //   ),
          //   onTap: () {
          //     launchUrl(codeCanyonURL);
          //   },
          // ),
          // 16.height,
          // AppButton(
          //   color: appStore.isDarkMode ? scaffoldSecondaryDark : colorPrimary,
          //   child: Text('Website', style: boldTextStyle(color: white)),
          //   onTap: () {
          //     launchUrl(websiteUrl, forceWebView: true);
          //   },
          // ),
        ],
      ).paddingSymmetric(horizontal: 16).center(),
    );
  }
}
