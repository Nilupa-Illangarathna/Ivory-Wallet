import 'package:flutter/material.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/BudgetsList.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/TransectionsClass.dart';
import '../Classes/colors.dart';
import '../Widgets/curved_bottom_navigation_bar.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../Shared_Preferences_DB/LoadingClass.dart';
import '../Data_Load_From_DB/notes.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransections_LocalDatabase.dart';
import '../Data_Load_From_DB/BudgetsBD/Budgets_LocalDatabase.dart';
import '../Data_Load_From_DB/BudgetsBD/BudgetsFunctions.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransectionsFunctions.dart';
import '../Data_Load_From_DB/ExpenseCategoryDB/ExpenseCategory_LocalDatabase.dart';
import '../Data_Load_From_DB/ExpenseCategoryDB/ExpenseCategoryFunctions.dart';
import '../Data_Load_From_DB/IncomeCategoryDB/IncomeCategory_LocalDatabase.dart';
import '../Data_Load_From_DB/IncomeCategoryDB/IncomeCategoryFunctions.dart';
import '../main.dart';

class HomePage extends StatefulWidget {

  Future init() async {

  }

  void initState() {
    init();
  }





  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  late List<Note> BudgetsNoteList;
  late List<Note> AllTransectionsNoteList;
  late List<Note> ExpensesCaegoriesNoteList;
  late List<Note> IncomesCategoriesNoteList;

  bool isLoading = false;

  var ColourList =ColorsClass();

  bool flag = true;
  final elevation= 3.0;
  final elevationAppBar=2.0;

  @override
  void initState() {
    super.initState();
    if(GloableLoadingVariable>0){
      refreshNotes();
    }
    GloableLoadingVariable=-1;
  }


  @override
  void dispose() {
    super.dispose();
  }


  Future refreshNotes() async {
    setState(() => isLoading = true);
    this.BudgetsNoteList = await BudgetsDatabase.instance.readAllBudgetsNotes(tableBudgets);
    this.AllTransectionsNoteList = await AllTransectionsDatabase.instance.readAllBudgetsNotes(tableAllTransections);
    this.ExpensesCaegoriesNoteList = await ExpenseCategoryDatabase.instance.readAllBudgetsNotes(tableExpensesCaegories);
    this.IncomesCategoriesNoteList = await IncomeCategoryDatabase.instance.readAllBudgetsNotes(tableIncomesCaegories);
    await addOrUpdateNote();
    setState(() => isLoading = false);

  }


  Future<int> addOrUpdateNote() async {
    if (AllTransectionsNoteList.length == 0) {
      List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists(AllTransectionsForTheTime);
      for(int i=0;i<StringBasedList.length;i++){
        await AllTransections_addNote(StringBasedList[i],tableAllTransections);
      }
    }
    else{
      List<Note> temp=[];
      int val=AllTransectionsNoteList[0].ID.toInt();
      for(int i=0;i<AllTransectionsNoteList.length;i++){
        if(val>AllTransectionsNoteList[i].ID.toInt()){
          val=AllTransectionsNoteList[i].ID.toInt();
        }
      }
      for(int i=0;i<AllTransectionsNoteList.length;i++){
        for(int j=0;j<AllTransectionsNoteList.length;j++){
          if(AllTransectionsNoteList[j].ID.toInt()==val){
            temp.add(AllTransectionsNoteList[j]);
            val++;
          }
        }
      }
      AllTransectionsForTheTime=await UserSecureStorage.get_BackCategory_List(temp);
    }
    if (ExpensesCaegoriesNoteList.length == 0) {
      List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists(Currently_Using_Expense_Categories);
      for(int i=0;i<StringBasedList.length;i++){
        await ExpenseCategory_addNote(StringBasedList[i],tableExpensesCaegories);
      }
    }
    else{

      for(int i=0;i<ExpensesCaegoriesNoteList.length;i++){
        for(int j=0;j<ExpensesCaegoriesNoteList.length-1;j++){
          if(ExpensesCaegoriesNoteList[j].ID.toInt()>ExpensesCaegoriesNoteList[j+1].ID.toInt()){
            Note temp=ExpensesCaegoriesNoteList[j];
            ExpensesCaegoriesNoteList[j]=ExpensesCaegoriesNoteList[j+1];
            ExpensesCaegoriesNoteList[j+1]=temp;
          }
        }
      }
      Currently_Using_Expense_Categories=await UserSecureStorage.get_BackCategory_List(ExpensesCaegoriesNoteList);
    }
    if (IncomesCategoriesNoteList.length == 0) {
      List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists(Currently_Using_Income_Categories);
      for(int i=0;i<StringBasedList.length;i++){
        await IncomeCategory_addNote(StringBasedList[i],tableIncomesCaegories);
      }
    }
    else{
      List<Note> temp=[];
      int val=IncomesCategoriesNoteList[0].ID.toInt();
      for(int i=0;i<IncomesCategoriesNoteList.length;i++){
        if(val>IncomesCategoriesNoteList[i].ID.toInt()){
          val=IncomesCategoriesNoteList[i].ID.toInt();
        }
      }
      for(int i=0;i<IncomesCategoriesNoteList.length;i++){
        for(int j=0;j<IncomesCategoriesNoteList.length;j++){
          if(IncomesCategoriesNoteList[j].ID.toInt()==val){
            temp.add(IncomesCategoriesNoteList[j]);
            val++;
          }
        }
      }
      Currently_Using_Income_Categories=await UserSecureStorage.get_BackCategory_List(temp);
    }
    if (BudgetsNoteList.length == 0) {
      List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists(BudgetValues);
      for(int i=0;i<StringBasedList.length;i++){
        await Budgets_addNote(StringBasedList[i],tableBudgets);
      }
    }
    else{
      List <Note> temp=[];

      for(int i=0;i<Currently_Using_Expense_Categories.length;i++){
        for(int j=0;j<BudgetsNoteList.length;j++){
          if(Currently_Using_Expense_Categories[i].CategoryName==BudgetsNoteList[j].CategoryName){
            temp.add(BudgetsNoteList[j]);
          }
        }
      }
      BudgetValues=await UserSecureStorage.get_BackCategory_List(temp);
    }

    return 0;
  }








  @override
  Widget build(BuildContext context) {


    return
      isLoading
        ? Scaffold(
      body: Center(
          child: CircularProgressIndicator()
      ),
    )
        :
      Scaffold(

        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: ColourList.HomePageAppBarColor,
            toolbarHeight: MediaQuery.of(context).size.height*0.13,
            elevation: 40,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(70),/*bottomLeft: Radius.circular(70)*/)
            ),
            title: Stack(
              children: [
                Center(
                  child: Text(
                    'Ivory Wallet',
                    style: TextStyle(
                      fontFamily: "SelfDeceptionRegular",
                      fontSize: 50,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            )
        ),


        body: Stack(
          children: [
//Appbar



//Overview Screen
            Positioned(
              top: MediaQuery.of(context).size.height*0.02,
              left: MediaQuery.of(context).size.width*0.035,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.93,
                  height: MediaQuery.of(context).size.height*0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        color: ColourList.Overview_Dark_Colour, ////////////////////////////////////////////////////color
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColourList.Overview_Light_Color,////////////////////////////////////////////////////color
                        ColourList.Overview_Dark_Colour,////////////////////////////////////////////////////color
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("overview_page");
                      FiltersForTheApp.AccountType = "All Account";
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    ),
                    child:


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.03),
                          ),
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                          child: Image.asset("assets/HomepagePics/overview.png"),
                        ),
                        Text(
                          "Overview",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.white38,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.0,),
                      ],
                    ),


                  ),
                ),
              ),
            ),

// Income Screen
            Positioned(
              top: MediaQuery.of(context).size.height*0.255,
              left: MediaQuery.of(context).size.width*0.035,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.93,
                  height: MediaQuery.of(context).size.height*0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 40,
                        offset: Offset(0, 15),
                        color: ColourList.Income_Dark_Colour, ////////////////////////////////////////////////////color
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColourList.Income_Light_Color,////////////////////////////////////////////////////color
                        ColourList.Income_Dark_Colour,////////////////////////////////////////////////////color
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: (){

                      Navigator.of(context).pushNamed("incomes_page");
                      FiltersForTheApp.AccountType = "All Account";

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    ),
                    child:

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.03),
                          ),
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                          child: Image.asset("assets/HomepagePics/incomes.png"),
                        ),
                        Text(
                          " Income ",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.white38,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.0,),
                      ],
                    ),




                  ),
                ),
              ),
            ),
//
//Expense screen
            Positioned(
              top: MediaQuery.of(context).size.height*0.49,
              left: MediaQuery.of(context).size.width*0.035,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.93,
                  height: MediaQuery.of(context).size.height*0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        offset: Offset(0, 5),
                        color: ColourList.Expenses_Dark_Colour, ////////////////////////////////////////////////////color
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColourList.Expenses_Light_Color,////////////////////////////////////////////////////color
                        ColourList.Expenses_Dark_Colour,////////////////////////////////////////////////////color
                      ],
                    ),
                  ),

                  child: ElevatedButton(
                    onPressed: (){

                      Navigator.of(context).pushNamed("expenses_page");
                      FiltersForTheApp.AccountType = "All Account";

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                    ),
                    child:

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.03),
                          ),
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.height * 0.12,
                          child: Image.asset("assets/HomepagePics/expenses.png"),
                        ),
                        Text(
                          "Expenses",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Colors.white38,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.0,),
                      ],
                    ),

                  ),
                ),
              ),
            ),


//Bottom navigation bar
            BottomNavBarV2(true),
          ],
        )
    );
  }
}





