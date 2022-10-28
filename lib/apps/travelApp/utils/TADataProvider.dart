import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/travelApp/model/TADefaultModel.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAContants.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';

List<TADefaultModel> defaultData = [
  TADefaultModel(
    img: "",
    title: "",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: "",
    title: "",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: "",
    title: "",
    subtitle: "",
    desc: "",
  ),
];

List<TADefaultModel> dashboardPlacesList = [
  TADefaultModel(
    img: ta_travel4,
    title: "Los Angeles",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel5,
    title: "India",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "London",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel2,
    title: "Bali",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "NYC",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "USA",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "London",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel2,
    title: "Bali",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "NYC",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel4,
    title: "Los Angeles",
    subtitle: "",
    desc: "",
  ),
];

List<TADefaultModel> categoryList = [
  TADefaultModel(
    img: ta_travel8,
    title: "Streets",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel7,
    title: "Heritage",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "Mountains",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel5,
    title: "Ocean",
    subtitle: "",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Fly",
    subtitle: "",
    desc: "",
  ),
];

List<TADefaultModel> adventureList = [
  TADefaultModel(img: ta_travel7, title: "London", subtitle: "", desc: "", taHeight: 100,isSelected:true),
  TADefaultModel(img: ta_travel8, title: "Bali", subtitle: "", desc: "", taHeight: 150,isSelected:true),
  TADefaultModel(img: ta_travel1, title: "USA", subtitle: "", desc: "", taHeight: 200,isSelected:true),
  TADefaultModel(img: ta_travel2, title: "London", subtitle: "", desc: "", taHeight: 100,isSelected:true),
  TADefaultModel(img: ta_travel3, title: "Bali", subtitle: "", desc: "", taHeight: 150,isSelected:true),
  TADefaultModel(img: ta_travel4, title: "USA", subtitle: "", desc: "", taHeight: 200,isSelected:true),
];

List<TADefaultModel> profileRewardList = [
  TADefaultModel(
    img: ta_travel5,
    title: "Gold",
    subtitle: "Redeem miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "Platinum",
    subtitle: "book flight",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel7,
    title: "Gold",
    subtitle: "Redeem miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel8,
    title: "Platinum",
    subtitle: "book flight",
    desc: "",
  ),
];

List<TADefaultModel> myCardsList = [
  TADefaultModel(
    img: ta_card1,
    title: "Visa ending 1234",
    subtitle: "valid till 2029",
    desc: "",
  ),
  TADefaultModel(
    img: ta_card2,
    title: "Visa ending 1234",
    subtitle: "valid till 2029",
    desc: "",
  ),
  TADefaultModel(
    img: ta_card3,
    title: "Visa ending 1234",
    subtitle: "valid till 2029",
    desc: "",
  ),
];

List<TADefaultModel> taWalkThrough() {
  List<TADefaultModel> list = [];
  list.add(TADefaultModel(
    title: "Explore destination",
    desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    img: ta_walkthrough,
  ));
  list.add(TADefaultModel(title: "Choose a destination", desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', img: ta_walkthrough1));
  list.add(TADefaultModel(title: "Fly to destination", desc: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', img: ta_walkthrough2));
  return list;
}

List<TADefaultModel> popularList = [
  TADefaultModel(
    img: ta_travel7,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel2,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
];

List<TADefaultModel> placeImageList = [
  TADefaultModel(
    img: ta_travel4,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel5,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel2,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel4,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel5,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel7,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel8,
    title: "Surf Lesson",
    subtitle: "nyc miles",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Nyc Marathon",
    subtitle: "Run run run",
    desc: "",
  ),
];

List<TADefaultModel> reviewList = [
  TADefaultModel(
    img: ta_travel2,
    title: "Mebel Hanses",
    subtitle: "2 days ago",
    desc: taShortText,
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "Will Smith",
    subtitle: "1 week ago",
    desc: taShortText,
  ),
  TADefaultModel(
    img: ta_travel4,
    title: "Ellena A",
    subtitle: "1 month ago",
    desc: taShortText,
  ),
];

List<TADefaultModel> notificationList = [
  TADefaultModel(
    img: ta_travel5,
    title: "Exciting offer",
    subtitle: "2 days ago",
    desc: taShortText,
    iconData: Ionicons.flower,
  ),
  TADefaultModel(
    img: ta_travel6,
    title: "Win a voucher",
    subtitle: "1 week ago",
    desc: taShortText,
    iconData: Ionicons.gift,
  ),
  TADefaultModel(
    img: ta_travel7,
    title: "50% off on erly bookings",
    subtitle: "1 month ago",
    desc: taShortText,
    iconData: Icons.monetization_on_outlined,
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Exciting offer",
    subtitle: "2 days ago",
    desc: taShortText,
    iconData: Ionicons.flower,
  ),
  TADefaultModel(
    img: ta_travel2,
    title: "Win a voucher",
    subtitle: "1 week ago",
    desc: taShortText,
    iconData: Ionicons.gift,
  ),
  TADefaultModel(
    img: ta_travel3,
    title: "50% off on erly bookings",
    subtitle: "1 month ago",
    desc: taShortText,
    iconData: Icons.monetization_on_outlined,
  ),
];

List<TADefaultModel> taAllPlacesList = [
  TADefaultModel(img: ta_travel4, title: "Grand Tour of Europe", subtitle: "nyc miles", price: "\$250", day: "4 day -4 cities", desc: "", isSelected: true),
  TADefaultModel(
    img: ta_travel5,
    title: "Tour of NYC",
    subtitle: "nyc miles",
    price: "\$350",
    day: "4 day -4 cities",
    desc: "",
  ),
  TADefaultModel(img: ta_travel6, title: "NewYork Weekend Trip", subtitle: "nyc miles", price: "\$250", day: "4 day -4 cities", desc: "", isSelected: true),
  TADefaultModel(
    img: ta_travel7,
    title: "Tour of NYC",
    subtitle: "nyc miles",
    price: "\$350",
    day: "4 day -4 cities",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel8,
    title: "5 days in LA",
    subtitle: "nyc miles",
    price: "\$250",
    day: "4 day -4 cities",
    desc: "",
  ),
  TADefaultModel(
    img: ta_travel1,
    title: "Tour of NYC",
    subtitle: "nyc miles",
    price: "\$350",
    day: "4 day -4 cities",
    desc: "",
  ),
];

List<Widget> sheetsList = [
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('1'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('2'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('3'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('4'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('5'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('6'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('7'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
  sheetRowWidget('8'),
  sheetWidget(),
  sheetWidget(),
  sheetWidget(),
];
