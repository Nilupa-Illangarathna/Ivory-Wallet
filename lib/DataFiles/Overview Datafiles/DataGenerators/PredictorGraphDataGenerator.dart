import 'package:flutter/material.dart';
import '../../../Classes/All Contralling Dart Files/category_types.dart';
import '../../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../../Classes/All Contralling Dart Files/TransectionsClass.dart';
import '../../../Classes/enums.dart';
import '../../../DataFiles/StackedGraphDataFunction.dart';
import 'package:intl/intl.dart';

//Total Costs per each Category each day as a list
class ListOfAmountsPerEachCategory{
  Categories CategoryData;
  List <double> ListForEachDay=[];

  final startday = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  final date2 = DateTime.now();



  ListOfAmountsPerEachCategory(this.CategoryData){
    for(int dayCount=0;dayCount<=date2.difference(startday).inDays.toInt();dayCount++){
      // print(date2.difference(startday).inDays.toInt());
      double count=0.0;
      for(int GoingTheroughTransections=0;GoingTheroughTransections<AllTransectionsForTheTime.length;GoingTheroughTransections++){
        if( AllTransectionsForTheTime[GoingTheroughTransections].CategoryType == this.CategoryData.CategoryType &&
            AllTransectionsForTheTime[GoingTheroughTransections].CategoryName == this.CategoryData.CategoryName &&
            AllTransectionsForTheTime[GoingTheroughTransections].Date.difference(startday).inDays.toInt() == dayCount){
          count+=AllTransectionsForTheTime[GoingTheroughTransections].TransectionAmount;
        }
      }
      ListForEachDay.add(count);
    }
  }


}




//We can get income/expense list of all the category data
List <ListOfAmountsPerEachCategory> ReturnCostsOfEachDate(List <Categories> SetOFCategories){

  List <ListOfAmountsPerEachCategory> ReturnList=[];
  for(int i=0;i<SetOFCategories.length;i++){
    ReturnList.add(ListOfAmountsPerEachCategory(SetOFCategories[i]));
  }
  return ReturnList;
}

//Finished taking costs and incomes per each day.. Now to prediction part
class DayToDayTotalMoneyInOrOutFlawSet{
  List <ListOfAmountsPerEachCategory> Income = ReturnCostsOfEachDate(Currently_Using_Income_Categories);
  List <ListOfAmountsPerEachCategory> Expense = ReturnCostsOfEachDate(Currently_Using_Expense_Categories);
}


DayToDayTotalMoneyInOrOutFlawSet Function() {
//Object for Above DayToDayTotalMoneyInOrOutFlawSet class
DayToDayTotalMoneyInOrOutFlawSet DayToDayTotalMoneyInOrOutFlawSetObject =DayToDayTotalMoneyInOrOutFlawSet();
return DayToDayTotalMoneyInOrOutFlawSetObject;
}


//Total Per Category for horizontal Tile View
List <Categories> horizontal_Tile_View_Data(String IncomeOrExpense, PrecictionPageData EnumVal){

  List <ListOfAmountsPerEachCategory> dataList=[];
  IncomeOrExpense=="Incomes"? dataList = Function().Income : dataList=Function().Expense;

  List <Categories> TempReturnEachCateegoryEndOfTheMonthPredictedTotal=[];

  for(int EachCategory=0;EachCategory<dataList.length;EachCategory++){
    Categories Temp = dataList[EachCategory].CategoryData;
    Temp.TransectionAmount=0;
    Temp.CurrentSum=0;

    //None ZeroCost days count(past)
    int NoneZeroCostDaysCount=0;

    for(int GoingThroughEachDay=0;GoingThroughEachDay<dataList[EachCategory].ListForEachDay.length;GoingThroughEachDay++){
      Temp.TransectionAmount+=dataList[EachCategory].ListForEachDay[GoingThroughEachDay];
      if(dataList[EachCategory].ListForEachDay[GoingThroughEachDay]!=0){
        NoneZeroCostDaysCount++;
      }
    }

    if(Temp.TransectionAmount!=0  ){ ///////////////////////////////////////////////////////////////////////////////////////////   Methanata danna dawas kiyak onida adu gane predict karanna kiyana eka (&& NoneZeroCostDaysCount>=7) wage   //////////////////////////////////
      Temp.CurrentSum = (Temp.TransectionAmount/dataList[EachCategory].ListForEachDay.length).ceil()*30;
    }
    else{
      Temp.CurrentSum=0;
    }

    TempReturnEachCateegoryEndOfTheMonthPredictedTotal.add(Temp);

  }

  if(EnumVal==PrecictionPageData.getTotalPredictedPerEachCategory){
    return TempReturnEachCateegoryEndOfTheMonthPredictedTotal;
  }
  else{
    return [];
  }


}










List<BubbleChartData> Create_Bubble_Charts_DataList(DateTime starting_date,DateTime ending_date, String IncomeOrExpense,String AccountType){

  List<BubbleChartData> tempchartData = [];
  final difference = ending_date. difference(starting_date). inDays+1;

  for(int dateIndex=difference-1;dateIndex>=0;dateIndex--){
    final date = DateTime.now().subtract(Duration(days: dateIndex));
    final date1=DateFormat('dd/MM/yyyy').format(date);
    // ChartData temp = ChartData(date1.toString(), [OneSectorDefine("fuck", 60, Colors.red)]);
    List <Categories> Currently_Using_Categories_temp;
    IncomeOrExpense =="Incomes"? Currently_Using_Categories_temp=Currently_Using_Income_Categories : Currently_Using_Categories_temp=Currently_Using_Expense_Categories;
    List <BubbleOneSectorDefine> tempcategoryaddition= [];
    for(int categoryIndex=0;categoryIndex<12;categoryIndex++){
      if(categoryIndex<Currently_Using_Categories_temp.length) {

        Categories TempCategry=Currently_Using_Categories_temp[categoryIndex];
        TempCategry.TransectionAmount=50;
        tempcategoryaddition.add(BubbleOneSectorDefine(Currently_Using_Categories_temp[categoryIndex].CategoryName, 0, Currently_Using_Categories_temp[categoryIndex].ButtonColor,Currently_Using_Categories_temp[categoryIndex],true));
      }
      else{
        tempcategoryaddition.add(BubbleOneSectorDefine("", 0, Colors.white,Currently_Using_Categories_temp[0],true));
      }
      // print(tempcategoryaddition[tempcategoryaddition.length-1].Category);
    }
    tempchartData.add(BubbleChartData(date1, tempcategoryaddition),);
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





