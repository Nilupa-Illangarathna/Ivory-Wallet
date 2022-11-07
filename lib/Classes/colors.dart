import 'package:flutter/material.dart';
import 'dart:math';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


class ColorsClass{

  //No color, Transparent color
  final TransparentColor = Colors.amber.withOpacity(0);
  //Appbar Colors
  final income_appbar_purple= HexColor("#2F5AAD");

  //Homepage Appbar Colour
  final HomePageAppBarColor=HexColor("#001C34");

  //Homepage Colors tile colors
  final Overview_Dark_Colour = Color(0xff45BAFB);
  final Overview_Light_Color = Color(0xff85E4FD);
  final Income_Dark_Colour = Color(0xff9182F9);
  final Income_Light_Color = Color(0xffB8ACFF);
  final Expenses_Dark_Colour = Color(0xffFEA741);
  final Expenses_Light_Color = Color(0xffFFCA8C);

  //Homepage BNB color
  final HomePage_BNB_Colour = Color(0xff586191);



  // final Expenses_Tile_Gradient = LinearGradient(colors: [HexColor("#D86C9D"),HexColor("#2E1E57")], begin: Alignment.centerLeft, end: Alignment.bottomRight,);
  // final Incomes_Tile_Gradient = LinearGradient(colors: [HexColor("#8E43BF"),HexColor("#3F2A78")], begin: Alignment.centerLeft, end: Alignment.centerRight,);
  // final Overview_Tile_Gradient = LinearGradient(colors: [HexColor("#D86C9D"),HexColor("#66325A")], begin: Alignment.center, end: Alignment.centerRight,);
  final Expenses_Tile_Gradient = LinearGradient(colors: [HexColor("#001C34"),HexColor("#2E1E57")], begin: Alignment.centerLeft, end: Alignment.bottomRight,);
  final Incomes_Tile_Gradient = LinearGradient(colors: [HexColor("#C8BFE7"),HexColor("#C0C0C0")], begin: Alignment.centerLeft, end: Alignment.centerRight,);
  final Overview_Tile_Gradient = LinearGradient(colors: [HexColor("#8F6A5B"),HexColor("#F2B39B")], begin: Alignment.center, end: Alignment.centerRight,);


  //Tramsections Colors
  // List <LinearGradient> GradientsForTransections=[LinearGradient(colors: [HexColor("#1E2261").withOpacity(0.3),HexColor("#1E2261").withOpacity(1)], begin: Alignment.bottomLeft, end: Alignment.bottomRight,transform: GradientRotation(pi), ),];
  // List <LinearGradient> GradientsForTransectionsBackground=[LinearGradient(colors: [HexColor("#16417C"),HexColor("#0F2D57")], begin: Alignment.bottomLeft, end: Alignment.topRight,transform: GradientRotation(pi), ),];

  //Overview page background color
  // final OverviewBackgroundColor = HexColor("#507F80");
  final OverviewBackgroundColor = Colors.white;
  // final OverviewChartBackground =  Colors.grey.withOpacity(0.8);
  final OverviewChartBackground =  Colors.white;
  final ChartTitleTextColor = Colors.black.withOpacity(0.5);
  final ChartPointerTextColor = Colors.black.withOpacity(0.7);
  final ChartLegendTextColor = Colors.black54;

  //Icon Selector Popup backgeound
  final IconSelectBackground =HexColor("#4A607D");


  //CategoryColors
  final catColorOne = HexColor("#D98C50");
  final catColorTwo = HexColor("#FF4989");
  final catColorThree = HexColor("#FFB145");
  final catColorFour = HexColor("#00ADF3");
  final catColorFive = HexColor("#FF5342");
  final catColorSix = HexColor("#6DC957");
  final catColorSeven = HexColor("#FF7A3D");
  final catColorEight = HexColor("#9271D5");
  final catColorNine = HexColor("#30C7B5");
  final catColorTen = HexColor("#698696");
  final catColorEleven = HexColor("#FFD942");
  final catColorTwelve = HexColor("#C2678D");

  //CategoryEndColors
  final catColorOneEnd = HexColor("#6B5269");
  final catColorTwoEnd = HexColor("#6B5269");
  final catColorThreeEnd = HexColor("#6B5269");
  final catColorFourEnd = HexColor("#6B5269");
  final catColorFiveEnd = HexColor("#6B5269");
  final catColorSixEnd = HexColor("#6B5269");
  final catColorSevenEnd = HexColor("#6B5269");
  final catColorEightEnd = HexColor("#6B5269");
  final catColorNineEnd = HexColor("#6B5269");
  final catColorTenEnd = HexColor("#6B5269");
  final catColorElevenEnd = HexColor("#6B5269");
  final catColorTwelveEnd = HexColor("#6B5269");


  final HomepageBackground_Colour = HexColor("#8D93B4");




}