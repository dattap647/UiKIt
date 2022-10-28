import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

InputDecoration buildInputDecoration({String? name, Color? color, IconData? prefixIcon, Color? iconColor}) {
  return InputDecoration(
      hintText: name,
      hintStyle: TextStyle(color: color),
      prefixIcon: Icon(
        prefixIcon,
        color: iconColor,
        size: 20,
      ),
      border: InputBorder.none);
}

Widget activityWidget({String? priceText, String? textName}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(priceText!, style: boldTextStyle(color: white)),
      4.height,
      Text(
        textName!,
        style: secondaryTextStyle(color: icWhiteColor, size: 10),
      )
    ],
  );
}

Widget statusWidget({String? statusName, Color? color}) {
  return Row(
    children: [
      Container(
        height: 6,
        width: 6,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      ),
      4.width,
      Text(statusName!, style: TextStyle(color: icWhiteColor)),
    ],
  );
}

Widget dialogWidget({String? image, String? title, String? subTitle, String? hintText, String? btnTExt, Function()? onTap}) {
  return Center(
    child: Material(
      type: MaterialType.transparency,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: boxDecorationDefault(color: icScaffoldBgColor),
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image!, width: 100),
            16.width,
            Text(title!, style: boldTextStyle(size: 30, color: white)),
            16.height,
            Text(
              subTitle!,
              style: secondaryTextStyle(color: icSecTextColor),
              textAlign: TextAlign.center,
            ),
            16.height,
            Container(
              padding: EdgeInsets.only(left: 8, bottom: 8, top: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: icNavyBlueColor),
              child: TextField(
                style: TextStyle(color: icWhiteColor),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: secondaryTextStyle(color: icWhiteColor),
                  suffixIcon: Icon(Icons.phone_outlined, color: icWhiteColor, size: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
            16.height,
            AppButton(
              text: btnTExt,
              textColor: Colors.white,
              color: icSkip,
              width: 100,
              onTap: () {
                onTap!();
              },
            ).paddingAll(16),
          ],
        ),
      ),
    ),
  );
}
