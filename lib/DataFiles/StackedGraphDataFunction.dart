import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Classes/colors.dart';
import '../Classes/All Contralling Dart Files/TransectionsClass.dart';
import 'package:intl/intl.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';


List<ChartData> Create_Stacked_Charts_DataList(DateTime starting_date,DateTime ending_date, String IncomeOrExpense,String AccountType){

  List<ChartData> tempchartData = [];
  final difference = ending_date. difference(starting_date). inDays+1;

  for(int dateIndex=difference-1;dateIndex>=0;dateIndex--){
    final date = DateTime.now().subtract(Duration(days: dateIndex));
    final date1=DateFormat('dd/MM/yyyy').format(date);
    // ChartData temp = ChartData(date1.toString(), [OneSectorDefine("fuck", 60, Colors.red)]);
    List <Categories> Currently_Using_Categories_temp;
    IncomeOrExpense =="Incomes"? Currently_Using_Categories_temp=Currently_Using_Income_Categories : Currently_Using_Categories_temp=Currently_Using_Expense_Categories;
    List <OneSectorDefine> tempcategoryaddition= [];
    for(int categoryIndex=0;categoryIndex<12;categoryIndex++){
      if(categoryIndex<Currently_Using_Categories_temp.length) {
        tempcategoryaddition.add(OneSectorDefine(Currently_Using_Categories_temp[categoryIndex].CategoryName, 0, Currently_Using_Categories_temp[categoryIndex].ButtonColor));
      }
      else{
        tempcategoryaddition.add(OneSectorDefine("", 0, Colors.transparent));
      }
      // print(tempcategoryaddition[tempcategoryaddition.length-1].Category);
    }
    tempchartData.add(ChartData(date1, tempcategoryaddition));
  }



  for(int dateIndex=0;dateIndex<AllTransectionsForTheTime.length;dateIndex++){
    if(IncomeOrExpense=="Incomes" && AllTransectionsForTheTime[dateIndex].CategoryType=="Incomes" && (FiltersForTheApp.AccountType=="All Account" ||
            FiltersForTheApp.AccountType=="Card" && AllTransectionsForTheTime[dateIndex].AccountData =="Card"||
            FiltersForTheApp.AccountType=="Cash" && AllTransectionsForTheTime[dateIndex].AccountData =="Cash")){
      // if(FiltersForTheApp.IncomeOrExpense=="All Types")



      // print("${AllTransectionsForTheTime[dateIndex].ID}");
      final date1 = DateFormat('dd/MM/yyyy')
          .format(AllTransectionsForTheTime[dateIndex].Date);
      for (int checkDate = 0;
      checkDate < tempchartData.length;
      checkDate++) {
        if (tempchartData[checkDate].Date == date1) {
          // print("${tempchartData[checkDate].Date} is equal to ${date1} and index is${checkDate}");
          for (int CategoryIndex = 0; CategoryIndex < 12; CategoryIndex++) {
            if (tempchartData[checkDate].Sectors[CategoryIndex].Category == AllTransectionsForTheTime[dateIndex].CategoryName) {
              tempchartData[checkDate].Sectors[CategoryIndex].size+=AllTransectionsForTheTime[dateIndex].TransectionAmount;
              // print(tempchartData[checkDate].Sectors[CategoryIndex].size);
            }
          }
        }
      }




    }
    else if(IncomeOrExpense=="Expenses" && AllTransectionsForTheTime[dateIndex].CategoryType=="Expenses" && (FiltersForTheApp.AccountType=="All Account" ||
        FiltersForTheApp.AccountType=="Card" && AllTransectionsForTheTime[dateIndex].AccountData =="Card"||
        FiltersForTheApp.AccountType=="Cash" && AllTransectionsForTheTime[dateIndex].AccountData =="Cash")){
      // print("${AllTransectionsForTheTime[dateIndex].ID}");
      final date1 = DateFormat('dd/MM/yyyy')
          .format(AllTransectionsForTheTime[dateIndex].Date);
      for (int checkDate = 0;
      checkDate < tempchartData.length;
      checkDate++) {
        if (tempchartData[checkDate].Date == date1) {
          // print("${tempchartData[checkDate].Date} is equal to ${date1} and index is${checkDate}");
          for (int CategoryIndex = 0; CategoryIndex < 12; CategoryIndex++) {
            if (tempchartData[checkDate].Sectors[CategoryIndex].Category == AllTransectionsForTheTime[dateIndex].CategoryName) {
              tempchartData[checkDate].Sectors[CategoryIndex].size+=AllTransectionsForTheTime[dateIndex].TransectionAmount;
              // print(tempchartData[checkDate].Sectors[CategoryIndex].size);
            }
          }
        }
      }
    }
  }
  return tempchartData;
}



class ChartData{
  ChartData(this.Date, this.Sectors);
  String Date;
  List <OneSectorDefine> Sectors;
}


class OneSectorDefine{
  String Category;
  double size;
  var color;
  OneSectorDefine(this.Category,this.size,this.color);
}


class BubbleOneSectorDefine{
  String Category;
  double size;
  var color;
  bool BoldOrNot;
  Categories CategoryObject;
  BubbleOneSectorDefine(this.Category,this.size,this.color,this.CategoryObject,this.BoldOrNot);
}



class BubbleChartData{
  BubbleChartData(this.Date, this.Sectors);
  String Date;
  List <BubbleOneSectorDefine> Sectors;
}