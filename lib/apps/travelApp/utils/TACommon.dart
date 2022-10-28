// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASearchScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../nftApp/utils/Colors.dart';

Widget taCachedImage(String url,
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool usePlaceholderIfUrlEmpty = true,
    double? radius}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(
        height: height!,
        width: width!,
        fit: fit!,
        alignment: alignment,
        radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(
            height: height!,
            width: width!,
            fit: fit!,
            alignment: alignment!,
            radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(
            height: height!,
            width: width!,
            fit: fit!,
            alignment: alignment!,
            radius: radius);
      },
    );
  } else {
    return Image.asset(url,
            height: height,
            width: width,
            fit: fit,
            alignment: alignment ?? Alignment.center)
        .cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget(
    {double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    double? radius}) {
  return Image.asset('images/Travel/placeholder.jpg',
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center)
      .cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget searchTextField(
    {BuildContext? context, Function? onTap, isReadOnly: false}) {
  return Container(
    decoration: boxDecorationWithShadow(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : white,
      borderRadius: radius(25),
      spreadRadius: 1,
      blurRadius: 2,
    ),
    child: AppTextField(
      textFieldType: TextFieldType.OTHER,
      textStyle: secondaryTextStyle(color: black),
      autoFocus: false,
      readOnly: isReadOnly,
      onTap: () {
        if (isReadOnly)
          TASearchScreen().launch(context!, duration: 300.milliseconds);
      },
      decoration: InputDecoration(
        fillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : white,
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        hintText: '    Search your trip here',
        hintStyle: secondaryTextStyle(),
        suffixIcon: Container(
            margin: EdgeInsets.all(8),
            decoration: boxDecorationWithShadow(
              backgroundColor: TAColorPrimary,
              borderRadius: radius(25),
            ),
            child: Icon(Icons.search, color: TAColorSecondary)),
      ),
    ).cornerRadiusWithClipRRect(100),
  );
}

Widget travelTitleLogoText() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: boxDecorationWithRoundedCorners(
            boxShape: BoxShape.circle, backgroundColor: TAColorPrimary),
        child: Icon(Icons.airplanemode_on, color: Colors.white, size: 15),
      ),
      16.width,
      Text(
        'Travel',
        style: boldTextStyle(size: 14),
      )
    ],
  );
}

Widget circleButtonWidget() {
  return Container(
    height: 45,
    width: 45,
    decoration: boxDecorationWithShadow(
        backgroundColor: TAColorPrimary, borderRadius: radius(25)),
    child: Icon(Icons.arrow_forward_outlined, color: Colors.white),
  );
}

InputDecoration TAInputDecoration(BuildContext context,
        {String? hintText, Widget? suffix, required Color borderColor}) =>
    InputDecoration(
      suffixIcon: suffix,
      errorBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: TAColorPrimary)),
      labelText: hintText,
    );

Widget taBackButton(BuildContext context,
    {Color iconColor = Colors.white, double iconSize = 22}) {
  return IconButton(
    padding: EdgeInsets.zero,
    onPressed: () {
      finish(context);
    },
    icon: Icon(Icons.arrow_back_ios, color: iconColor, size: iconSize),
  );
}

Widget taAppBar({Widget? leading, Widget? trailing, Widget? title}) {
  return Row(
    children: [
      leading!,
      title.expand(),
      trailing != null ? trailing : SizedBox()
    ],
  ).paddingSymmetric(horizontal: 16, vertical: 16);
}

Widget sheetWidget({Color color: Colors.grey}) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
        backgroundColor: Colors.grey.shade200, borderRadius: radius(12)),
    height: 50,
    width: 40,
  );
}

Widget sheetRowWidget(String? text) {
  return SizedBox(
    child: Text(text!, style: primaryTextStyle(size: 14)).center(),
    height: 50,
    width: 40,
  );
}
