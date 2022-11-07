import 'package:flutter/material.dart';
import 'dart:math';
import 'All Contralling Dart Files/FiltersForAccounts.dart';

// DateTime ReturnDateTime(int days){
//   return (DateTime.now().subtract(Duration(days: days,hours: Random().nextInt(24),minutes: Random().nextInt(60),seconds: Random().nextInt(60),))).add(Duration(days:1));
// }

DateTime ReturnDateTime(int days){
  return (DateTime.now().subtract(Duration(days: days,)));
}



double returnMonry(){
  int num = (Random().nextInt(60))%14;
  if(num==0){
    return ((Random().nextInt(100))*5+5).toDouble();
  }
  else if(num>=1 && num<=2){
    return ((Random().nextInt(80))*5+5).toDouble();
  }
  else if(num>=3 && num<=5){
    return ((Random().nextInt(60))*5+5).toDouble();
  }
  else{
    return ((Random().nextInt(30))*5+5).toDouble();
  }
}