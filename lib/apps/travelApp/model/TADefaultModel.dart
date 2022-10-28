import 'package:flutter/material.dart';

class TADefaultModel {
  String? img;
  String? title;
  String? subtitle;
  String? desc;
  String? price;
  String? day;
  double? taHeight;
  IconData? iconData;
  bool isSelected;

  TADefaultModel({this.img, this.title, this.subtitle, this.desc, this.taHeight, this.iconData, this.price, this.day, this.isSelected = false});
}
