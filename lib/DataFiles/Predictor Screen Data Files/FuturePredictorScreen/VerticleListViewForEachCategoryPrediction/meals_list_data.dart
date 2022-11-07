import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = Colors.transparent,
    this.endColor = Colors.transparent,
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  Color startColor;
  Color endColor;
  List<String>? meals;
  double kacl;





  static List<MealsListData> tabIconsList = <MealsListData>[];




}



//Horizontal list item list
MealsListData VerticalDataList=MealsListData();