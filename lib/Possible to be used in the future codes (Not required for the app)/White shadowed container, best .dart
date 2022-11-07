import 'package:flutter/material.dart';
import '../DataFiles/Budget related/shared.dart';
import '../DataFiles/Budget related/constants.dart';
import '../Classes/All Contralling Dart Files/BudgetsList.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width:200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(right: 0, left:0 , bottom: 0, top: 0),
        padding: EdgeInsets.all(6),
        child:Icon(
          Icons.favorite,
          color: Colors.red,
          size: 35,
        ),
      ),
    );
  }
}
