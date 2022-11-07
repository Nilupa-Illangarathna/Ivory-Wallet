import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

var ColourList =ColorsClass();


//All category class objects
class Categories{
  final int ID;
  final String CategoryName;  //8 CHARACTERS CAN BE ADDED
  final String CategoryType;
  double CurrentSum;
  final String IconAddress;
  final Color ButtonColor;
  final Color EndColor;
  double TransectionAmount;
  final bool IsRecurring;
  final String AccountData;//Card, cash, or more
  final DateTime Date;
  final TimeOfDay Time;
  bool IsFavorite;
  bool IsBadTransection;
  Categories(
      this.ID,
      this.CategoryName,
      this.CategoryType,
      this.CurrentSum,
      this.IconAddress,
      this.ButtonColor,
      this.EndColor,
      this.TransectionAmount,
      this.IsRecurring,
      this.AccountData,
      this.Date,
      this.Time,
      this.IsFavorite,
      this.IsBadTransection,);
}




//Income related
List <Categories> Currently_Using_Income_Categories = [
  Categories(1, "Interests", "Incomes", 0,"assets/CategoryIcons/Incomes/bank.png",ColourListForIncomeCategories[0],EndColourListForIncomeCategories[0], 0 , false , "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(2, "Building", "Incomes", 0, "assets/CategoryIcons/Incomes/building.png",ColourListForIncomeCategories[1],EndColourListForIncomeCategories[1], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(3, "Savings", "Incomes", 0,  "assets/CategoryIcons/Incomes/saving.png",ColourListForIncomeCategories[2],EndColourListForIncomeCategories[2],0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(4, "Creditors", "Incomes", 0, "assets/CategoryIcons/Incomes/creditcard.png",ColourListForIncomeCategories[3],EndColourListForIncomeCategories[3], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(5, "Rent", "Incomes", 0, "assets/CategoryIcons/Incomes/wallet.png",ColourListForIncomeCategories[4],EndColourListForIncomeCategories[4], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
];
//Income related
List <HexColor> ColourListForIncomeCategories = [
  ColourList.catColorTwo, //1
  ColourList.catColorSeven, //2
  ColourList.catColorSix, //3
  ColourList.catColorEight, //4
  ColourList.catColorFive, //5
  ColourList.catColorNine, //6
  ColourList.catColorTwelve, //7
  ColourList.catColorFour, //8
  ColourList.catColorThree, //9
  ColourList.catColorTen, //10
  ColourList.catColorEleven, //11
  ColourList.catColorOne, //12
];
List <HexColor> EndColourListForIncomeCategories = [
  ColourList.catColorTwoEnd, //1
  ColourList.catColorSevenEnd, //2
  ColourList.catColorSixEnd, //3
  ColourList.catColorEightEnd, //4
  ColourList.catColorFiveEnd, //5
  ColourList.catColorNineEnd, //6
  ColourList.catColorTwelveEnd, //7
  ColourList.catColorFourEnd, //8
  ColourList.catColorThreeEnd, //9
  ColourList.catColorTenEnd, //10
  ColourList.catColorElevenEnd, //11
  ColourList.catColorOneEnd, //12
];


//Income related   //12 maximum characters for names
List <Categories> Currently_Using_Expense_Categories = [
  Categories(1, "Food", "Expenses", 0,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[0],EndColourListForExpenseCategories[0], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(2, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],EndColourListForExpenseCategories[1], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(3, "Fashion", "Expenses", 0,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[2],EndColourListForExpenseCategories[2],0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(4, "Beverage", "Expenses", 0, "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],EndColourListForExpenseCategories[3], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(5, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[4],EndColourListForExpenseCategories[4], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(6, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],EndColourListForExpenseCategories[5],0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(7, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],EndColourListForExpenseCategories[6], 0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),
];
//Income related
List <HexColor> ColourListForExpenseCategories = [
  ColourList.catColorThree,
  ColourList.catColorTwelve,
  ColourList.catColorEight,
  ColourList.catColorFour,
  ColourList.catColorNine,
  ColourList.catColorSix,
  ColourList.catColorSeven,
  ColourList.catColorTen,
  ColourList.catColorOne,
  ColourList.catColorFive,
  ColourList.catColorEleven,
  ColourList.catColorTwo,
];
List <HexColor> EndColourListForExpenseCategories = [
  ColourList.catColorThreeEnd,
  ColourList.catColorTwelveEnd,
  ColourList.catColorEightEnd,
  ColourList.catColorFourEnd,
  ColourList.catColorNineEnd,
  ColourList.catColorSixEnd,
  ColourList.catColorSevenEnd,
  ColourList.catColorTenEnd,
  ColourList.catColorOneEnd,
  ColourList.catColorFiveEnd,
  ColourList.catColorElevenEnd,
  ColourList.catColorTwoEnd,
];

//All icon AppDrawerRelatedImages for category class objects
class CategoryIconAddition{
  final int ID;
  final String Address;  //8 CHARACTERS CAN BE ADDED

  CategoryIconAddition(this.ID,this.Address);
}
List <CategoryIconAddition> IconSelectionMenu = [
  CategoryIconAddition(1,"assets/CategoryIcons/Incomes/bank.png"),
  CategoryIconAddition(2,"assets/CategoryIcons/Incomes/bitcoin.png"),
  CategoryIconAddition(3,"assets/CategoryIcons/Incomes/building.png"),
  CategoryIconAddition(4,"assets/CategoryIcons/Incomes/creditcard.png"),
  CategoryIconAddition(5,"assets/CategoryIcons/Incomes/saving.png"),
  CategoryIconAddition(6,"assets/CategoryIcons/Incomes/wallet.png"),
  CategoryIconAddition(7,"assets/CategoryIcons/Expenses/beer.png"),
  CategoryIconAddition(8,"assets/CategoryIcons/Expenses/beverages.png"),
  CategoryIconAddition(9,"assets/CategoryIcons/Expenses/calls.png"),
  CategoryIconAddition(10,"assets/CategoryIcons/Expenses/clothes.png"),
  CategoryIconAddition(11,"assets/CategoryIcons/Expenses/coffee.png"),
  CategoryIconAddition(12,"assets/CategoryIcons/Expenses/education.png"),
  CategoryIconAddition(13,"assets/CategoryIcons/Expenses/food.png"),
  CategoryIconAddition(14,"assets/CategoryIcons/Expenses/games.png"),
  CategoryIconAddition(15,"assets/CategoryIcons/Expenses/groceries.png"),
  CategoryIconAddition(16,"assets/CategoryIcons/Expenses/health.png"),
  CategoryIconAddition(17,"assets/CategoryIcons/Expenses/house.png"),
  CategoryIconAddition(18,"assets/CategoryIcons/Expenses/joy.png"),
  CategoryIconAddition(19,"assets/CategoryIcons/Expenses/music.png"),
  CategoryIconAddition(20,"assets/CategoryIcons/Expenses/pets.png"),
  CategoryIconAddition(21,"assets/CategoryIcons/Expenses/plane.png"),
  CategoryIconAddition(22,"assets/CategoryIcons/Expenses/security.png"),
  CategoryIconAddition(23,"assets/CategoryIcons/Expenses/shopping.png"),
  CategoryIconAddition(24,"assets/CategoryIcons/Expenses/smoking.png"),
  CategoryIconAddition(25,"assets/CategoryIcons/Expenses/snack.png"),
  CategoryIconAddition(26,"assets/CategoryIcons/Expenses/sports.png"),
  CategoryIconAddition(27,"assets/CategoryIcons/Expenses/subscribtions.png"),
  CategoryIconAddition(28,"assets/CategoryIcons/Expenses/vehicle.png"),
];


