import 'package:flutter/material.dart';
import '../DataFiles/Budget related/constants.dart';
import '../DataFiles/Budget related/data.dart';
import '../DataFiles/Budget related/budgetSetterSettings.dart';
import '../DataFiles/Budget related/shared.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import 'dart:math';
import '../../Widgets/curved_bottom_navigation_bar.dart';
import '../../Classes/All Contralling Dart Files/BudgetsList.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';


List <String> Backgrounds =[
  "assets/Budget page/Backgrounds/1.jpg",
  "assets/Budget page/Backgrounds/2.jpg",
  "assets/Budget page/Backgrounds/3.jpg",
  "assets/Budget page/Backgrounds/4.jpg",
  "assets/Budget page/Backgrounds/5.jpg",
];

List <int> indexes=[];

void create_a_list(){
  for(int i=0;i<Currently_Using_Expense_Categories.length;i++){
    indexes.add(Random().nextInt(5));
  }
}

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List<bool> optionSelected = [true, true];

  bool CashSelect=true;
  bool CardSelect=true;

  int TextFieldValue(String STR){
    int Return=0;
    for(int i=0;i<BudgetValues.length;i++){
      if(BudgetValues[i].CategoryName==STR){
        Return = BudgetValues[i].TransectionAmount.toInt();
      }
    }
    return Return;
  }


  @override
  Widget build(BuildContext context) {

    create_a_list();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.90,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        buildTextTitleVariation1('Budget Setter'),

                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04,),
                    child: Row(
                      children: [
                        buildTextTitleVariation2('Account', false),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                        buildTextTitleVariation2('Select', false),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      option('Cash', 'assets/Budget page/cash.png', 0),
                      option('Card', 'assets/Budget page/creditcards.png', 1),
                    ],
                  ),

                  SizedBox(height: 16,),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04,),
                    child: Row(
                      children: [

                        buildTextTitleVariation2(CashSelect && CardSelect?'Both' :(CashSelect? "Cash": (CardSelect? "Card" : "Select")), false),

                        SizedBox(width: 8,),

                        buildTextTitleVariation2(CashSelect && CardSelect? 'Accounts': "Account", true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04,),
                    child: Row(
                      children: [
                        buildTextSubTitleVariation1("Set the amounts for ${CashSelect && CardSelect?'Both' :(CashSelect? "Cash": (CardSelect? "Card" : "Select"))} ${CashSelect && CardSelect? 'Accounts': "Account"}..."),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),

                  Container(
                    height: 350,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildCategories(),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.022,
                  ),



                ],
              ),
            ),
          ),

          BottomNavBarV2(false),

        ],
      ),
    );
  }



  Widget option(String text, String image, int index){
    return GestureDetector(
      onTap: () {
        setState(() {
          if(index==0){
            CashSelect = !optionSelected[index];
          }
          if(index==1){
            CardSelect = !optionSelected[index];
          }
          optionSelected[index] = !optionSelected[index];
          // CardSelect=!CardSelect;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.06,
        width: MediaQuery.of(context).size.width*0.3,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.03,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.08,
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.white : Colors.black,
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),

            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: MediaQuery.of(context).size.width * 0.034,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }






  List<Widget> buildCategories(){
    List<Widget> list = [];
    for (var i = 0; i < Currently_Using_Expense_Categories.length; i++) {
      list.add(buildCategory(Currently_Using_Expense_Categories[i], i));
    }
    return list;
  }

  Widget buildCategory(Categories Category, int index){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(Category,CashSelect,CardSelect,indexes[index])),////////////////////
        );
      },///////////////////////////////////////////////////////
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Hero(
                tag: Category.IconAddress,////////////////////////////
                child: Container(
                  margin: EdgeInsets.all(1),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    image: DecorationImage(

                      image: AssetImage(Backgrounds[indexes[index]]),///////////////////////
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.95), BlendMode.dstATop),
                    ),
                  ),
                  child: Image.asset(Category.IconAddress,color: Colors.white.withOpacity(0.8),),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            buildRecipeTitle(Category.CategoryName),/////////////////////////

            buildTextSubTitleVariation2("Click to change..."),/////////////////////

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                buildCalories("${FiltersForTheApp.CurrentCurrencyType} ${TextFieldValue(Category.CategoryName)}"),//////////////////////

                Icon(
                  Icons.favorite,
                  color: Category.ButtonColor,
                  size: 35,
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}