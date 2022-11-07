import 'package:flutter/material.dart';
import 'category_types.dart';
import 'FiltersForAccounts.dart';
import '../RandomGenerators.dart';

bool CheckTransectionAvailability(String IncomeOExpenseInput){

  Map <String,bool> temp={
    "All Types All Accounts":false, //0
    "All Types Card":false,
    "All Types Cash":false,
    "Incomes All Accounts":false,
    "Incomes Card":false,
    "Incomes Cash":false,

    "Expenses All Accounts":false,
    "Expenses Card":false,
    "Expenses Cash":false,
  };


  for(int i=0;i<AllTransectionsForTheTime.length;i++){
    if(AllTransectionsForTheTime[i].TransectionAmount>0 && FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date)
        && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date) ){
      temp["All Types All Accounts"]=true;
    }
    if(AllTransectionsForTheTime[i].AccountData=="Card" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["All Types Card"]=true;
    }
    if(AllTransectionsForTheTime[i].AccountData=="Cash" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["All Types Cash"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Incomes" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Incomes All Accounts"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Incomes" && AllTransectionsForTheTime[i].AccountData=="Card" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Incomes Card"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Incomes" && AllTransectionsForTheTime[i].AccountData=="Cash" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Incomes Cash"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Expenses" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Expenses All Accounts"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Expenses" && AllTransectionsForTheTime[i].AccountData=="Card" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Expenses Card"]=true;
    }
    if(AllTransectionsForTheTime[i].CategoryType=="Expenses" && AllTransectionsForTheTime[i].AccountData=="Cash" && AllTransectionsForTheTime[i].TransectionAmount>0 &&
        FiltersForTheApp.StartingDate.isBefore(AllTransectionsForTheTime[i].Date) && FiltersForTheApp.EndingDate.isAfter(AllTransectionsForTheTime[i].Date)){
      temp["Expenses Cash"]=true;
    }
  }

  bool Return=false;

  if(FiltersForTheApp.AccountType=="All Account" && IncomeOExpenseInput=="Incomes"){
    Return=(temp["Incomes All Accounts"])!;
    print("Incomes All Accounts");
  }
  else if(FiltersForTheApp.AccountType=="Card" && IncomeOExpenseInput=="Incomes"){
    Return=temp["Incomes Card"]!;
    print("Incomes Card");
  }
  else if(FiltersForTheApp.AccountType=="Cash" && IncomeOExpenseInput=="Incomes"){
    Return=temp["Incomes Cash"]!;
    print("Incomes Cash");
  }
  else if(FiltersForTheApp.AccountType=="All Account" && IncomeOExpenseInput=="Expenses"){
    Return=temp["Expenses All Accounts"]!;
    print("Expenses All Accounts");
  }
  else if(FiltersForTheApp.AccountType=="Card" && IncomeOExpenseInput=="Expenses"){
    Return=temp["Expenses Card"]!;
    print("Expenses Card");
  }
  else if(FiltersForTheApp.AccountType=="Cash" && IncomeOExpenseInput=="Expenses"){
    Return=temp["Expenses Cash"]!;
    print("Expenses Cash");
  }
  return Return;
}

List <Categories> AllTransectionsForTheTime = [];

// // Dummy set with past values
// List <Categories> AllTransectionsForTheTime = [
//   Categories(0, "Food", "Expenses", 0,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[0],EndColourListForExpenseCategories[0], 100 , false, "Cash",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(1, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/building.png",ColourListForIncomeCategories[1],EndColourListForIncomeCategories[1], 400 , false, "Card",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(2, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[1],EndColourListForExpenseCategories[1], 120 , false, "Card",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(3, "Rent", "Incomes", 0, "assets/CategoryIcons/Incomes/wallet.png",ColourListForIncomeCategories[4],EndColourListForIncomeCategories[4], 240 , false, "Card",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(4, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[2],EndColourListForExpenseCategories[2], 360 , false, "Cash",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(5, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[3],EndColourListForExpenseCategories[3], 70 , false, "Card",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(6, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[4],EndColourListForExpenseCategories[4],240 , false, "Cash",ReturnDateTime(1),TimeOfDay.now(),false,false),
//   Categories(7, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],EndColourListForExpenseCategories[5],40 , false, "Card",ReturnDateTime(1),TimeOfDay.now(),false,false),
//   Categories(8, "Fashion", "Expenses", 0,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[6],EndColourListForExpenseCategories[6],700 , false, "Card",ReturnDateTime(1),TimeOfDay.now(),false,false),/////////////////Fasion
//   Categories(9, "Food", "Expenses", 0,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[7],EndColourListForExpenseCategories[7], 140 , false, "Cash",ReturnDateTime(1),TimeOfDay.now(),false,false),///////////////////////Green
//   Categories(10, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[8],EndColourListForExpenseCategories[8], 300 , false, "Card",ReturnDateTime(1),TimeOfDay.now(),false,false),//////////////////Mobile
//   Categories(11, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[9],EndColourListForExpenseCategories[9], 80 , false, "Cash",ReturnDateTime(2),TimeOfDay.now(),false,false),
//   Categories(12, "Food", "Expenses", 0,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[10],EndColourListForExpenseCategories[10], 105 , false, "Cash",ReturnDateTime(1),TimeOfDay.now(),false,false),
//   Categories(13, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],EndColourListForIncomeCategories[0], 60 , false, "Card",ReturnDateTime(2),TimeOfDay.now(),false,false),
//   Categories(14, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 20 , false, "Cash",ReturnDateTime(2),TimeOfDay.now(),false,false),
//   Categories(15, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[11],EndColourListForExpenseCategories[11], 150 , false, "Card",ReturnDateTime(2),TimeOfDay.now(),false,false),
//   Categories(16, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],ColourListForExpenseCategories[5],170 , false, "Card",ReturnDateTime(2),TimeOfDay.now(),false,false),
//   Categories(17, "Fashion", "Expenses", 0,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[2],ColourListForExpenseCategories[2],50 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(18, "Creditors", "Incomes", 0, "assets/CategoryIcons/Incomes/creditcard.png",ColourListForIncomeCategories[3],ColourListForIncomeCategories[3], 180 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(19, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],ColourListForExpenseCategories[1], 50 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(20, "Savings", "Incomes", 0,  "assets/CategoryIcons/Incomes/saving.png",ColourListForIncomeCategories[2],ColourListForIncomeCategories[2],300 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(21, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 30 , false, "Card",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(22, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],ColourListForExpenseCategories[5], 120 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(23, "Snacks", "Expenses", 0,  "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[7],ColourListForExpenseCategories[7], 48 , false, "Cash",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(24, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[4],ColourListForExpenseCategories[4], 135 , false, "Card",ReturnDateTime(3),TimeOfDay.now(),false,false),
//   Categories(25, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 55 , false, "Cash",ReturnDateTime(4),TimeOfDay.now(),false,false),
//   Categories(26, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],ColourListForExpenseCategories[6], 30 , false, "Cash",ReturnDateTime(4),TimeOfDay.now(),false,false),
//   Categories(27, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],ColourListForExpenseCategories[5], 76 , false, "Card",ReturnDateTime(4),TimeOfDay.now(),false,false),
//   Categories(28, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],ColourListForExpenseCategories[3], 105 , false, "Cash",ReturnDateTime(4),TimeOfDay.now(),false,false), //////////////////////////
//   Categories(29, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],ColourListForExpenseCategories[1], 100 , false, "Card",ReturnDateTime(5),TimeOfDay.now(),false,false),
//   Categories(30, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/building.png",ColourListForIncomeCategories[1],ColourListForIncomeCategories[1], 300 , false, "Card",ReturnDateTime(5),TimeOfDay.now(),false,false),
//   Categories(31, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],ColourListForExpenseCategories[6], 360 , false, "Card",ReturnDateTime(5),TimeOfDay.now(),false,false),
//   Categories(32, "Savings", "Incomes", 0,  "assets/CategoryIcons/Incomes/saving.png",ColourListForIncomeCategories[2],ColourListForIncomeCategories[2],200 , false, "Cash",ReturnDateTime(5),TimeOfDay.now(),false,false),
//   Categories(33, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],ColourListForExpenseCategories[3], 105 , false, "Cash",ReturnDateTime(4),TimeOfDay.now(),false,false),
//   Categories(34, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 270 , false, "Card",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(35, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],ColourListForExpenseCategories[3], 68 , false, "Cash",ReturnDateTime(6),TimeOfDay.now(),false,false),
//   Categories(36, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],ColourListForExpenseCategories[1], 100 , false, "Cash",ReturnDateTime(6),TimeOfDay.now(),false,false),
//   Categories(37, "Fashion", "Expenses", 0,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[2],ColourListForExpenseCategories[2],30 , false, "Card",ReturnDateTime(6),TimeOfDay.now(),false,false),
//   Categories(38, "Creditors", "Incomes", 0, "assets/CategoryIcons/Incomes/creditcard.png",ColourListForIncomeCategories[3],ColourListForIncomeCategories[3], 105 , false, "Cash",ReturnDateTime(0),TimeOfDay.now(),false,false),
//   Categories(39, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],ColourListForExpenseCategories[1], 70 , false, "Card",ReturnDateTime(6),TimeOfDay.now(),false,false),
//   Categories(40, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/building.png",ColourListForIncomeCategories[1],ColourListForIncomeCategories[1], 20 , false, "Cash",ReturnDateTime(7),TimeOfDay.now(),false,false),
//   Categories(41, "Snacks", "Expenses", 0,  "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[7],ColourListForExpenseCategories[7],85 , false, "Card",ReturnDateTime(7),TimeOfDay.now(),false,false),
//   Categories(42, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[4],ColourListForExpenseCategories[4], 70 , false, "Cash",ReturnDateTime(7),TimeOfDay.now(),false,false),
//   Categories(43, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 50 , false, "Card",ReturnDateTime(7),TimeOfDay.now(),false,false),
//   Categories(44, "Savings", "Incomes", 0,  "assets/CategoryIcons/Incomes/saving.png",ColourListForIncomeCategories[2],ColourListForIncomeCategories[2],130 , false, "Card",ReturnDateTime(8),TimeOfDay.now(),false,false),
//   Categories(45, "Creditors", "Incomes", 0, "assets/CategoryIcons/Incomes/creditcard.png",ColourListForIncomeCategories[3],ColourListForIncomeCategories[3], 30 , false, "Card",ReturnDateTime(8),TimeOfDay.now(),false,false),
//   Categories(46, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],ColourListForExpenseCategories[5],370 , false, "Card",ReturnDateTime(8),TimeOfDay.now(),false,false),
//   Categories(47, "Snacks", "Expenses", 0,  "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[7],ColourListForExpenseCategories[7], 60 , false, "Cash",ReturnDateTime(8),TimeOfDay.now(),false,false),
//   Categories(48, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],ColourListForExpenseCategories[6], 30 , false, "Card",ReturnDateTime(8),TimeOfDay.now(),false,false),
//   Categories(49, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/building.png",ColourListForIncomeCategories[1],ColourListForIncomeCategories[1], 60 , false, "Cash",ReturnDateTime(9),TimeOfDay.now(),false,false),
//   Categories(50, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/wallet.png",ColourListForIncomeCategories[4],ColourListForIncomeCategories[4], 140 , false, "Cash",ReturnDateTime(9),TimeOfDay.now(),false,false),
//   Categories(51, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],ColourListForExpenseCategories[3], 105 , false, "Cash",ReturnDateTime(9),TimeOfDay.now(),false,false),
//   Categories(52, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],ColourListForExpenseCategories[1], 50 , false, "Card",ReturnDateTime(9),TimeOfDay.now(),false,false),
//   Categories(53, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],ColourListForExpenseCategories[5], 70 , false, "Cash",ReturnDateTime(9),TimeOfDay.now(),false,false),
//   Categories(54, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],ColourListForIncomeCategories[0], 50 , false, "Card",ReturnDateTime(9),TimeOfDay.now(),false,false),
// ];