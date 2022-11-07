import 'package:flutter/material.dart';
import '../Classes/colors.dart';
import '../Widgets/category_button.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Classes/ChartData.dart';
import '../../DataFiles/Budget related/constants.dart';
import '../Widgets/Charts/Gauge.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';

class ThreeGaugesInARow extends StatefulWidget {
  // const FourCategoryButtonsInARow({Key? key}) : super(key: key);

  var Width;
  var Height;
  var CategoriesList;
  var BudgetsList;
  var SetOfIndexes;
  ThreeGaugesInARow(this.Width,this.Height,this.CategoriesList,this.BudgetsList,this.SetOfIndexes);

  @override
  _ThreeGaugesInARowState createState() => _ThreeGaugesInARowState(Width,Height,CategoriesList,BudgetsList,SetOfIndexes);
}

class _ThreeGaugesInARowState extends State<ThreeGaugesInARow> {
  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;

  var Width;
  var Height;
  var CategoriesList;
  var BudgetsList;
  var SetOfIndexes;
  _ThreeGaugesInARowState(this.Width,this.Height,this.CategoriesList,this.BudgetsList,this.SetOfIndexes);

  @override
  Widget build(BuildContext context) {
    return CategoriesList.length==0 && SetOfIndexes==0?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),
        Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),
        Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),],
    ):(
        CategoriesList.length>=3 && SetOfIndexes==0 || CategoriesList.length>=6 && SetOfIndexes==1|| CategoriesList.length>=9 && SetOfIndexes==2|| CategoriesList.length>=12 && SetOfIndexes==3?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child:  BudgetsList[0+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[0+3*SetOfIndexes].CategoryName},",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :  GaugeTile(Width,Height,CategoriesList[0+3*SetOfIndexes],BudgetsList[0+3*SetOfIndexes])  ),),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child: BudgetsList[1+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[1+3*SetOfIndexes].CategoryName}",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :  GaugeTile(Width,Height,CategoriesList[1+3*SetOfIndexes],BudgetsList[1+3*SetOfIndexes]))),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child: BudgetsList[2+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[2+3*SetOfIndexes].CategoryName}",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :  GaugeTile(Width,Height,CategoriesList[2+3*SetOfIndexes],BudgetsList[2+3*SetOfIndexes]))),]):
        CategoriesList.length==2 && SetOfIndexes==0 || CategoriesList.length==5 && SetOfIndexes==1|| CategoriesList.length==8 && SetOfIndexes==2|| CategoriesList.length==11 && SetOfIndexes==3?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child: BudgetsList[0+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[0+3*SetOfIndexes].CategoryName}",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :  GaugeTile(Width,Height,CategoriesList[0+3*SetOfIndexes],BudgetsList[0+3*SetOfIndexes])),),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child: BudgetsList[1+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[1+3*SetOfIndexes].CategoryName}",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :  GaugeTile(Width,Height,CategoriesList[1+3*SetOfIndexes],BudgetsList[1+3*SetOfIndexes]))),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),],
    ):CategoriesList.length==1 && SetOfIndexes==0 || CategoriesList.length==4 && SetOfIndexes==1|| CategoriesList.length==7 && SetOfIndexes==2|| CategoriesList.length==10 && SetOfIndexes==3?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),child: BudgetsList[0+3*SetOfIndexes].TransectionAmount==0? Center(child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Center(child:Text("${BudgetsList[0+3*SetOfIndexes].CategoryName}",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 18,),)),Center(child: Text("Set Budget",style: TextStyle(color: ColourList.ChartTitleTextColor,fontFamily: 'Roboto',fontWeight: FontWeight.w800,fontSize: 16,),)),],))  :   GaugeTile(Width,Height,CategoriesList[0+3*SetOfIndexes],BudgetsList[0+3*SetOfIndexes])),),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),
            Material(elevation: elevationvalue, borderRadius: BorderRadius.all(Radius.circular(20),),child: Container(height: Height, width: Width,decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20),), boxShadow: [kBoxShadow],),)),],
        ):Container()
    );
  }
}


