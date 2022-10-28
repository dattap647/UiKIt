// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MAImages.dart';

Widget appSettingData(
    {double? width,
    String? title,
    String? subTitle,
    IconData? icon,
    VoidCallback? onTap,
    BuildContext? context}) {
  return InkWell(
    onTap: () {
      onTap!.call();
    },
    borderRadius: BorderRadius.circular(defaultRadius),
    child: Container(
      width: width,
      padding: EdgeInsets.all(8),
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.4)), borderRadius: BorderRadius.circular(defaultRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              8.width,
              Text(title.toString(),
                      style: primaryTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)
                  .expand(),
              Icon(
                MaterialCommunityIcons.arrow_right,
                color: Colors.grey,
                size: 22,
              ),
            ],
          ),
          subTitle != null ? 8.height : SizedBox(),
          subTitle != null
              ? Text(subTitle,
                      style: secondaryTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)
                  .paddingLeft(32)
              : SizedBox()
        ],
      ),
    ),
  );
}

InputDecoration inputDecoration(
    {String? name, bool? isPass = false, Icon? prefixIcon, Icon? suffixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 8, top: 16, right: 8),
    hintText: name,
    hintStyle: secondaryTextStyle(),
    prefixIcon: prefixIcon,
    labelStyle: primaryTextStyle(color: textSecondaryColor),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey, width: 0.5)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey, width: 0.5)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey, width: 0.5)),
    suffixIconColor: textSecondaryColor,
    alignLabelWithHint: true,
    isDense: true,
  );
}

Widget appButton(BuildContext context,
    {String? text, Color bgColor = primaryColor, required Function onTap}) {
  return AppButton(
      text: text,
      textStyle: boldTextStyle(color: Colors.white),
      width: context.width(),
      elevation: 2,
      padding: EdgeInsets.all(16),
      shapeBorder: RoundedRectangleBorder(
          borderRadius: radius(12),
          side: BorderSide(color: Colors.transparent)),
      color: bgColor,
      onTap: onTap);
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset(MAStress, fit: BoxFit.cover);

Widget commonCacheImageWidget(String? url,
    {double? width, BoxFit? fit, double? height}) {
  if (url.toString().startsWith('https')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder:
            placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit);
  }
}

Widget dotIndicator(list, i) {
  return SizedBox(
    height: 30,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        list.length,
        (ind) {
          return Container(
            height: 4,
            width: 16,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: i == ind ? primaryColor : Colors.grey.withOpacity(0.2),
                shape: BoxShape.rectangle,
                borderRadius: radius(8)),
          );
        },
      ),
    ),
  );
}

Widget songWidget(
    {String? img, String? title, String? subtitle, double? progress}) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: boxDecorationWithRoundedCorners(
        borderRadius: radius(12),
        backgroundColor: Colors.grey.withOpacity(0.2)),
    child: Row(
      children: [
        Image.asset(img!, height: 75, width: 75, fit: BoxFit.cover),
        8.width,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, maxLines: 2, style: boldTextStyle(size: 14)),
            8.height,
            Text(subtitle!, maxLines: 2, style: secondaryTextStyle(size: 12)),
            8.height,
            if (progress != null)
              SizedBox(
                height: 0,
                child: Slider(
                    min: 0.0,
                    max: 1.0,
                    activeColor: primaryColor,
                    value: progress,
                    onChanged: null),
              ),
          ],
        )
      ],
    ),
  );
}

Widget favIcon(
    {Function? onTap, bool? isTapped = false, bool? enableBg = false}) {
  return Container(
    decoration: enableBg!
        ? boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle, backgroundColor: Colors.black54)
        : null,
    padding: EdgeInsets.all(8),
    child: LikeButton(
            bubblesColor: BubblesColor(
                dotPrimaryColor: Colors.white,
                dotSecondaryColor: Colors.white,
                dotLastColor: Colors.white,
                dotThirdColor: Colors.white),
            padding: EdgeInsets.only(left: 4, right: 0),
            size: 20)
        .center(),
  );
}

Widget downloadIcon({bool? enableBg = false}) {
  return GestureDetector(
    onTap: () async {
      await 1.seconds.delay;
      toast('your meditation is downloaded offline');
    },
    child: Container(
      decoration: enableBg!
          ? boxDecorationWithRoundedCorners(
              boxShape: BoxShape.circle, backgroundColor: Colors.black54)
          : null,
      padding: EdgeInsets.all(8),
      child: Icon(
        MaterialCommunityIcons.download,
        color: Colors.white,
        size: 22,
      ),
    ),
  );
}

Widget playButton({bool? enableBg = false}) {
  return Container(
      decoration: enableBg!
          ? boxDecorationWithRoundedCorners(
              boxShape: BoxShape.circle, backgroundColor: Colors.black54)
          : null,
      padding: EdgeInsets.all(8),
      child: Icon(
        MaterialCommunityIcons.play,
        color: Colors.white.withOpacity(0.8),
        size: 28,
      ));
}

Widget playIcon(String name,
    {Color color = Colors.black54,
    IconData icon = MaterialCommunityIcons.play}) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
        borderRadius: radius(8), backgroundColor: color),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    child: Row(
      children: [
        Text(name,
            style: secondaryTextStyle(
                size: 16, color: Colors.white.withOpacity(0.8))),
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 22),
      ],
    ),
  );
}

Widget backButton(BuildContext context, {bool enableBg = false}) {
  return Container(
    decoration: enableBg
        ? boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle, backgroundColor: Colors.black54)
        : null,
    padding: EdgeInsets.all(8),
    child: Icon(
      Icons.arrow_back,
      color: Colors.white,
      size: 22,
    ),
  ).onTap(() {
    Navigator.pop(context);
  });
}

Future<void> launchUrl(String url, {bool forceWebView = false}) async {
  await launch(url, forceWebView: forceWebView, enableJavaScript: true)
      .catchError((e) {
    toast('Invalid URL: $url');
  });
}

Widget overViewWidget(IconData icon, String title, String count) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon),
      8.height,
      Text(
        title,
        style: primaryTextStyle(),
        textAlign: TextAlign.center,
      ),
      4.height,
      Text(count, style: boldTextStyle(color: primaryColor))
    ],
  );
}

Widget todayReminder() {
  final f = new DateFormat('yyyy-MM-dd hh:mm');
  return Container(
    decoration:
        boxDecorationWithRoundedCorners(backgroundColor: secondaryColor),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Icon(Icons.light),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily Meditation', style: boldTextStyle()),
            4.height,
            Text(f.format(new DateTime.now()), style: secondaryTextStyle())
            // Text(formatter, style: secondaryTextStyle(size: 14)),
          ],
        ).expand(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              decoration: boxDecorationDefault(
                  color: primaryColor, borderRadius: radius(4)),
              child: Text('Sleep',
                  style: secondaryTextStyle(size: 14, color: Colors.white)),
            ),
            4.height,
            Text('5 minute', style: secondaryTextStyle(size: 14)),
          ],
        ),
      ],
    ),
  );
}

Brightness getSystemIconBrightness() {
  return appStore.isDarkModeOn ? Brightness.light : Brightness.dark;
}

Brightness getSystemBrightness() {
  return appStore.isDarkModeOn ? Brightness.dark : Brightness.light;
}

String durationFormatter(int milliSeconds) {
  int seconds = milliSeconds ~/ 1000;
  final int hours = seconds ~/ 3600;
  seconds = seconds % 3600;
  var minutes = seconds ~/ 60;
  seconds = seconds % 60;
  final hoursString = hours >= 10
      ? '$hours'
      : hours == 0
          ? '00'
          : '0$hours';
  final minutesString = minutes >= 10
      ? '$minutes'
      : minutes == 0
          ? '00'
          : '0$minutes';
  final secondsString = seconds >= 10
      ? '$seconds'
      : seconds == 0
          ? '00'
          : '0$seconds';
  final formattedTime =
      '${hoursString == '00' ? '' : hoursString + ':'}$minutesString:$secondsString';
  return formattedTime;
}
