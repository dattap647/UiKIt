import 'package:flutter/cupertino.dart';

class MABasicModel{
  String? img;
  String? characterImg;
  String? title;
  String? subtitle;
  String? time;
  IconData? iconData;
  String? longDesc;
  String? attachedFile;
  String? extention;
  String? shortDesc;
  bool isSelected;

  MABasicModel({this.img,this.characterImg, this.title, this.subtitle, this.time, this.iconData, this.longDesc, this.shortDesc,this.attachedFile,this.extention,this.isSelected=false});

}