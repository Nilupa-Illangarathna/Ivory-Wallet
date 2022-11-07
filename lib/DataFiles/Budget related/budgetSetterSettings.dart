import 'package:flutter/material.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/category_types.dart';
import 'constants.dart';
import 'shared.dart';
import 'data.dart';
import 'dart:math';
import '../../Classes/All Contralling Dart Files/TransectionsClass.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../Classes/All Contralling Dart Files/BudgetsList.dart';
import '../../Widgets/curved_bottom_navigation_bar.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../Shared_Preferences_DB/LoadingClass.dart';
import '../../Data_Load_From_DB/BudgetsBD/BudgetsFunctions.dart';
import '../../Data_Load_From_DB/notes.dart';


List <String> Backgrounds =[
  "assets/Budget page/Backgrounds/1.jpg",
  "assets/Budget page/Backgrounds/2.jpg",
  "assets/Budget page/Backgrounds/3.jpg",
  "assets/Budget page/Backgrounds/4.jpg",
  "assets/Budget page/Backgrounds/5.jpg",
];



class Detail extends StatefulWidget {

  final Categories Category;
  final bool CashSelect;
  final bool CardSelect;
  final int index;

  Detail(@required this.Category,this.CashSelect,this.CardSelect,this.index);

  @override
  State<Detail> createState() => _DetailState(Category,CashSelect,CardSelect,index);
}

class _DetailState extends State<Detail> {

  final Categories Category;
  final bool CashSelect;
  final bool CardSelect;
  final int index;

  _DetailState(@required this.Category,this.CashSelect,this.CardSelect,this.index);

  List <int> ValuesForDescription=[0,0,0];

  double CategoryAmountInput=0;





  void SettingFunction(){
    for(int i=0;i<AllTransectionsForTheTime.length;i++){
      if(AllTransectionsForTheTime[i].CategoryName==Category.CategoryName){
        ValuesForDescription[0]+=(AllTransectionsForTheTime[i].TransectionAmount).toInt();
        if(AllTransectionsForTheTime[i].AccountData=="Cash"){
          ValuesForDescription[1]+=AllTransectionsForTheTime[i].TransectionAmount.toInt();
        }
        if(AllTransectionsForTheTime[i].AccountData=="Card"){
          ValuesForDescription[2]+=AllTransectionsForTheTime[i].TransectionAmount.toInt();
        }
      }
    }
  }


  int TextFieldValue(String STR){
    int Return=0;
    for(int i=0;i<BudgetValues.length;i++){
      if(BudgetValues[i].CategoryName==STR){
        Return = BudgetValues[i].TransectionAmount.toInt();
      }
    }
    return Return;
  }

  // void SetNewValue(String STR,double CategoryAmountInput){
  //   for(int i=0;i<BudgetValues.length;i++){
  //     if(FiltersForTheApp.AccountType=="All Account"){
  //       if(BudgetValues[i].CategoryName==STR){
  //         BudgetValues[i].TransectionAmount = CategoryAmountInput;
  //       }
  //     }
  //     else if(FiltersForTheApp.AccountType==BudgetValues[i].AccountData){
  //       if(BudgetValues[i].CategoryName==STR){
  //         BudgetValues[i].TransectionAmount = CategoryAmountInput;
  //       }
  //     }
  //
  //     print(BudgetValues[i].TransectionAmount);
  //   }
  //
  // }




  @override
  Widget build(BuildContext context) {

    ValuesForDescription=[0,0,0];
    SettingFunction();
    // CategoryAmountInput=TextFieldValue(Category.CategoryName).toDouble();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil(ModalRoute.withName('budget_page'));
            Navigator.of(context).pushNamed('budget_page');
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite,
              color: Category.ButtonColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      buildTextTitleVariation1(widget.Category.CategoryName), //Category name//////////////////

                    ],
                  ),
                ),

                SizedBox(height: 16,),

                Container(
                  // height: 310,
                  padding: EdgeInsets.only(left: 16),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [

                        Container(
                          height: 470,
                          color: Colors.transparent,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    SizedBox(height: 32,),

                                    buildTextTitleVariation2("Current value", false),

                                    buildTextSubTitleVariation1("${FiltersForTheApp.CurrentCurrencyType} ${TextFieldValue(Category.CategoryName)}"),

                                    SizedBox(height: 16,),

                                    TextField(
                                      // autocorrect: true,
                                      // autofocus: true,
                                      maxLength: 6,
                                      keyboardType: TextInputType.number,
                                      onChanged: (val){
                                        CategoryAmountInput=double.parse(val);
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.input,
                                          color: Category.ButtonColor,
                                        ),

                                        labelText: "Edit value",
                                        labelStyle: TextStyle(
                                          color: Colors.indigo.withOpacity(0.3),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 50,),

                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        buildNutrition(ValuesForDescription[0], "Category", "Net total"),//////////////////////
                                      ],
                                    ),

                                    SizedBox(
                                      height: 16,
                                    ),

                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        buildNutrition(ValuesForDescription[1], "Expence", "Cash total"),//////////////////////////
                                      ],
                                    ),

                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        buildNutrition(ValuesForDescription[2], "Expense", "Card total"),////////////////////////////
                                      ],
                                    ),

                                    SizedBox(height: 40,),

                                  ],
                                ),

                                Positioned(
                                  right: -80,
                                  child: Hero(
                                    tag: widget.Category.IconAddress,
                                    child: Container(
                                      height: 290,
                                      width: 290,
                                      padding: EdgeInsets.all(70),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: AssetImage(Backgrounds[index]),///////////////////////
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      child: Image.asset(Category.IconAddress,color: Colors.white.withOpacity(0.7),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),





                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.62,
            top: MediaQuery.of(context).size.width * 1.0,
            child: ElevatedButton(
              onPressed: (){
                setState(() async {
                  if(CategoryAmountInput.toInt()!=0){
                    for(int i=0;i<BudgetValues.length;i++){
                      if(BudgetValues[i].CategoryName==Category.CategoryName){
                        BudgetValues[i].TransectionAmount = CategoryAmountInput.toDouble();
                        List <Note> SendIn= await UserSecureStorage.set_ToStringConverted_Lists([BudgetValues[i]]);
                        Budgets_updateNote(SendIn[0],tableBudgets);
                      }
                    }

                  }
                  // for (int i = 0; i < BudgetValues.length; i++) {
                  //     print(BudgetValues[i].TransectionAmount);
                  // }
                });
              },
              child: Text("Set Value"),

              style: ElevatedButton.styleFrom(
                primary: Colors.grey[700],
                shadowColor: Colors.black,
                padding:EdgeInsets.symmetric(horizontal: 40,vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)),),
              ),




            ),
          )

        ],
      ),
    );
  }

  Widget buildNutrition(int value, String title, String subTitle){
    return Container(
      height: 60,
      width: 190,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [

          Container(
            height: 44,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              // shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                "${FiltersForTheApp.CurrentCurrencyType} ${value.toString()}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}