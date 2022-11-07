import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/category_types.dart';
import 'package:ivorywalletsolution/Data_Load_From_DB/AllTransectionDB/AllTransections_LocalDatabase.dart';
import 'package:ivorywalletsolution/Pages/Transections.dart';
import 'package:intl/intl.dart';
import '../../../../Classes/All Contralling Dart Files/TransectionsClass.dart';


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





  static List<MealsListData> tabIconsList = <MealsListData>[
    // MealsListData(
    //   imagePath: AllTransectionsForTheTime[0].IconAddress,
    //   titleTxt: AllTransectionsForTheTime[0].CategoryName,
    //   kacl: AllTransectionsForTheTime[0].TransectionAmount.toDouble(),
    //   meals: <String>[
    //     DateFormat.MMMMEEEEd().format(AllTransectionsForTheTime[0].Date).toString(),
    //     DateFormat.MMMMEEEEd().format(AllTransectionsForTheTime[9].Date).toString(),
    //     DateFormat.MMMMEEEEd().format(AllTransectionsForTheTime[16].Date).toString(),
    //   ],
    //   startColor: AllTransectionsForTheTime[0].ButtonColor,
    //   endColor: AllTransectionsForTheTime[0].EndColor,
    // ),
  ];




}



//Horizontal list item list
MealsListData VerticalDataList=MealsListData();