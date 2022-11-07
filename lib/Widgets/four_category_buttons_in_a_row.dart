import 'package:flutter/material.dart';
import '../Classes/colors.dart';
import '../Widgets/category_button.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';



class FourCategoryButtonsInARow extends StatefulWidget {
  // const FourCategoryButtonsInARow({Key? key}) : super(key: key);
  bool IsIncome;
  var Currently_Using_Categories;
  var SetOfIndexes;
  FourCategoryButtonsInARow(this.IsIncome,this.Currently_Using_Categories,this.SetOfIndexes);

  @override
  _FourCategoryButtonsInARowState createState() => _FourCategoryButtonsInARowState(IsIncome,Currently_Using_Categories,SetOfIndexes);
}

class _FourCategoryButtonsInARowState extends State<FourCategoryButtonsInARow> {
  var ColourList =ColorsClass();

  bool IsIncome;
  var Currently_Using_Categories;
  var SetOfIndexes;
  _FourCategoryButtonsInARowState(this.IsIncome,this.Currently_Using_Categories,this.SetOfIndexes);

  @override
  Widget build(BuildContext context) {
    return Currently_Using_Categories.length<8 && SetOfIndexes==1?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.15, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.15, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.15, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.15, color: ColourList.TransparentColor,),
      ],
    ):(Currently_Using_Categories.length>0+8*SetOfIndexes? (
        Currently_Using_Categories.length>1+8*SetOfIndexes?
        (
            Currently_Using_Categories.length>2+8*SetOfIndexes?
            (
                Currently_Using_Categories.length>3+8*SetOfIndexes?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(IsIncome,Currently_Using_Categories[0+8*SetOfIndexes]),
                    CategoryButton(IsIncome,Currently_Using_Categories[1+8*SetOfIndexes]),
                    CategoryButton(IsIncome,Currently_Using_Categories[2+8*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
                    CategoryButton(IsIncome,Currently_Using_Categories[3+8*SetOfIndexes]),
                  ],)
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryButton(IsIncome,Currently_Using_Categories[0+8*SetOfIndexes]),
                    CategoryButton(IsIncome,Currently_Using_Categories[1+8*SetOfIndexes]),
                    CategoryButton(IsIncome,Currently_Using_Categories[2+8*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
                    CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),),
                  ],)
            )  : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryButton(IsIncome,Currently_Using_Categories[0+8*SetOfIndexes]),
                CategoryButton(IsIncome,Currently_Using_Categories[1+8*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
                CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),),
                Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
              ],)
        )  : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryButton(IsIncome,Currently_Using_Categories[0+8*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
            CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),),
            Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
            Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
          ],)
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),), //  - assets/CategoryIcons/AddMore/addNewCategory.png
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
      ],
    ));
  }
}



class TwoCategoryButtonsInARow extends StatefulWidget {
  // const FourCategoryButtonsInARow({Key? key}) : super(key: key);

  bool IsIncome;
  var Currently_Using_Categories;
  var SetOfIndexes;
  TwoCategoryButtonsInARow(this.IsIncome,this.Currently_Using_Categories,this.SetOfIndexes);

  @override
  _TwoCategoryButtonsInARowState createState() => _TwoCategoryButtonsInARowState(IsIncome,Currently_Using_Categories,SetOfIndexes);
}

class _TwoCategoryButtonsInARowState extends State<TwoCategoryButtonsInARow> {
  var ColourList =ColorsClass();

  bool IsIncome;
  var Currently_Using_Categories;
  var SetOfIndexes;
  _TwoCategoryButtonsInARowState(this.IsIncome,this.Currently_Using_Categories,this.SetOfIndexes);

  @override
  Widget build(BuildContext context) {
    return Currently_Using_Categories.length<=3 && SetOfIndexes==0 || Currently_Using_Categories.length<=5 && SetOfIndexes==1?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
      ],
    ):
    Currently_Using_Categories.length>4+2*SetOfIndexes?
    (Currently_Using_Categories.length>5+2*SetOfIndexes?
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryButton(IsIncome,Currently_Using_Categories[4+2*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        CategoryButton(IsIncome,Currently_Using_Categories[5+2*SetOfIndexes]),  //  - assets/CategoryIcons/AddMore/addNewCategory.png
      ],
    ):Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryButton(IsIncome,Currently_Using_Categories[4+2*SetOfIndexes]), //  - assets/CategoryIcons/AddMore/addNewCategory.png
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),), //  - assets/CategoryIcons/AddMore/addNewCategory.png
      ],
    ))
        :Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryButton(IsIncome,Categories(-1, "Add", "Add", 0,  "assets/CategoryIcons/AddMore/addNewCategory.png",Colors.black.withOpacity(0.07),Colors.black.withOpacity(0.07),0 , false, "Null",DateTime.now(),TimeOfDay.now(),false,false),), //  - assets/CategoryIcons/AddMore/addNewCategory.png
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
        Container(height: MediaQuery.of(context).size.width * 0.15, width: MediaQuery.of(context).size.width * 0.25, color: ColourList.TransparentColor,),
      ],
    );
  }
}