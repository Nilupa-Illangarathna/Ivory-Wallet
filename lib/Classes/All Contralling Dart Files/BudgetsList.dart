import 'package:flutter/material.dart';
import 'category_types.dart';

// List <Categories> BudgetValues=[
//   Categories(1, "Food", "Expenses", 0,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[0],EndColourListForExpenseCategories[0], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(2, "Mobile", "Expenses", 0, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],EndColourListForExpenseCategories[1], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(3, "Fashion", "Expenses", 0,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[2],EndColourListForExpenseCategories[2],0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(4, "Beverage", "Expenses", 0 , "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],EndColourListForExpenseCategories[3], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(5, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[4],EndColourListForExpenseCategories[4], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(6, "Groceries", "Expenses", 0,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],EndColourListForExpenseCategories[5],0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
//   Categories(7, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],EndColourListForExpenseCategories[6], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
// ];

////Dummy Set
List <Categories> BudgetValues=[
  Categories(1, "Food", "Expenses", 10000,"assets/CategoryIcons/Expenses/food.png",ColourListForExpenseCategories[0],EndColourListForExpenseCategories[0], 10000 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(2, "Mobile", "Expenses", 3000, "assets/CategoryIcons/Expenses/calls.png",ColourListForExpenseCategories[1],EndColourListForExpenseCategories[1], 3000 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(3, "Fashion", "Expenses", 5000,  "assets/CategoryIcons/Expenses/clothes.png",ColourListForExpenseCategories[2],EndColourListForExpenseCategories[2],5000 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(4, "Beverage", "Expenses", 7000 , "assets/CategoryIcons/Expenses/beverages.png",ColourListForExpenseCategories[3],EndColourListForExpenseCategories[3], 7000 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(5, "Education", "Expenses", 0, "assets/CategoryIcons/Expenses/education.png",ColourListForExpenseCategories[4],EndColourListForExpenseCategories[4], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(6, "Groceries", "Expenses", 4000,  "assets/CategoryIcons/Expenses/groceries.png",ColourListForExpenseCategories[5],EndColourListForExpenseCategories[5],4000 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
  Categories(7, "Leisure", "Expenses", 0, "assets/CategoryIcons/Expenses/joy.png",ColourListForExpenseCategories[6],EndColourListForExpenseCategories[6], 0 , false, "Cash",DateTime.now(),TimeOfDay.now(),false,false),
];