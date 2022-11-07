import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivorywalletsolution/Classes/colors.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Widgets/PopUpMenu/popup_menu.dart';
import '../Widgets/PopUpMenu/menu_config.dart';
import '../Widgets/PopUpMenu/menu_item.dart';
import '../Classes/colors.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Classes/AccountsClass.dart';
import '../Classes/All Contralling Dart Files/TransectionsClass.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../Classes/All Contralling Dart Files/BudgetsList.dart';
import '../Data_Load_From_DB/notes.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransectionsFunctions.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransections_LocalDatabase.dart';
import '../Shared_Preferences_DB/LoadingClass.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransectionsFunctions.dart';
import '../Data_Load_From_DB/IncomeCategoryDB/IncomeCategoryFunctions.dart';
import '../Data_Load_From_DB/ExpenseCategoryDB/ExpenseCategoryFunctions.dart';
import '../Data_Load_From_DB/BudgetsBD/BudgetsFunctions.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

//148  175    392   423   451


class CategoryButton extends StatefulWidget {
  // const CategoryButton({Key? key}) : super(key: key);

  bool IsIncome;
  Categories OneCategory;
  CategoryButton(this.IsIncome,this.OneCategory);



  @override
  _CategoryButtonState createState() => _CategoryButtonState(IsIncome,OneCategory);
}

class _CategoryButtonState extends State<CategoryButton> {

  bool IsIncome;
  Categories OneCategory;
  _CategoryButtonState(this.IsIncome,this.OneCategory);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(OneCategory.CategoryName),
        SizedBox(height: MediaQuery.of(context).size.width * 0.011,),
        ButtonOnly(IsIncome,OneCategory.ID,OneCategory.CategoryType,  OneCategory.IconAddress, OneCategory.ButtonColor , OneCategory),
        SizedBox(height: MediaQuery.of(context).size.width * 0.011,),
        OneCategory.CategoryType!="Add"? (IsIncome? Text(IncomeFilteredCategoryValuesforincomeExpenses(Currently_Using_Income_Categories)[OneCategory.ID-1].TransectionAmount.toString()):Text(ExpenseFilteredCategoryValuesforincomeandexpenses(Currently_Using_Expense_Categories)[OneCategory.ID-1].TransectionAmount.toString())):(Text("0")),    //////////////////////////////////////////////////////////////////////////////////
      ],
    );
  }
}


class ButtonOnly extends StatefulWidget {

  bool IsIncome;
  Categories OneCategory;
  int ID;
  String IncomeOrExpense;
  String Address;
  Color ButtonColor;
  ButtonOnly(this.IsIncome,this.ID,this.IncomeOrExpense,this.Address,this.ButtonColor,this.OneCategory);  //Constructor

  @override
  _ButtonOnlyState createState() => _ButtonOnlyState(IsIncome,ID,IncomeOrExpense,Address,ButtonColor,OneCategory);
}


class _ButtonOnlyState extends State<ButtonOnly> with SingleTickerProviderStateMixin {

  var ColourList =ColorsClass();

  bool IsRefurringFunction(){
    return false;
  }

  //For adding new categories
  Categories OneCategory;

  String dropdownValue = FiltersForTheApp.Is_Cash;
  String DateInt="Today";


  String AddressofTheImagetemp="";
  String CategoryNameInput="";
  String CategoryAmountInput="";
  String CategoryDescriptionInput=""; ////////////////////////////////////////

  bool IsIncome;
  int ID;
  String IncomeOrExpense;
  String Address;
  Color ButtonColor;
  _ButtonOnlyState(this.IsIncome,this.ID,this.IncomeOrExpense,this.Address,this.ButtonColor,this.OneCategory);  //Constructor


  late double _scale;
  late AnimationController _controller;


  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  String _textDescription = '';
  double _confidence = 1.0;


  var NumberContraller = TextEditingController();
  var DescriptionContraller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 20),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    _speech = stt.SpeechToText();
  }


  //Icons Selector
  late PopupMenu menu;
  GlobalKey btnKey3 = GlobalKey();

  void onClickMenu(MenuItemProvider item) {
    // print('Click menu -> ${(int.parse(item.menuTitle))} ${(int.parse(item.menuTitle)).runtimeType}');
    AddressofTheImagetemp=IconSelectionMenu[int.parse(item.menuTitle)-1].Address;
  }

  void onDismiss() {
    print('Menu is dismiss');
  }
  void onShow() {
    print('Menu is show');
  }




  void AddIncomeExpenses(BuildContext ctx, Categories OneCategory ,bool IsIncome){
    int IDtemp = AllTransectionsForTheTime.length==0? 0:AllTransectionsForTheTime[AllTransectionsForTheTime.length-1].ID+1; //
    String CategoryNametemp=OneCategory.CategoryName;  //8 CHARACTERS CAN BE ADDED
    String CategoryTypetemp=OneCategory.CategoryType;  //
    double CurrentSumtemp;
    String AddressofTheImagete=OneCategory.IconAddress;  //
    Color ButtonColortemp=OneCategory.ButtonColor;  //
    Color EndButtonColortemp=OneCategory.EndColor;
    double TransectionAmounttemp; //
    bool IsRecurringtemp=IsRefurringFunction();
    String AccountDatatemp;
    DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3))));
    // DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10)))))))))));
    TimeOfDay Timetemp = TimeOfDay.now();


//148  175    392   423   451


// print('Click menu -> ${(int.parse(item.menuTitle))} ${(int.parse(item.menuTitle)).runtimeType}');

    Future submitdata() async{
      if ((CategoryAmountInput == ""  ||double.parse(CategoryAmountInput) <0) && _text == '')
      {
        return;

      }
      else
      {
        AccountDatatemp = dropdownValue;
        CurrentSumtemp=double.parse(CategoryAmountInput==""? _text:CategoryAmountInput);
        TransectionAmounttemp =CurrentSumtemp;
        var Temp = Categories(
          IDtemp,
          CategoryNametemp,
          CategoryTypetemp,
          CurrentSumtemp,
          AddressofTheImagete,
          ButtonColortemp,
          EndButtonColortemp,
          TransectionAmounttemp,
          IsRecurringtemp,
          AccountDatatemp,
          DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3)))),
          // Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10))))))))))),
          Timetemp,
          false,
          false,
        );
        AllTransectionsForTheTime.add(Temp);

        List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists([Temp]);
        AllTransections_addNote(StringBasedList[0],tableAllTransections);

//148  175    392   423   451

        dropdownValue = FiltersForTheApp.Is_Cash;;
        AddressofTheImagetemp="";
        CategoryNameInput="";
        CategoryAmountInput="";
        DateInt="Today";
        Navigator.of(context).pop();
        IsIncome? Navigator.of(context).pushReplacementNamed("incomes_page"):Navigator.of(context).pushReplacementNamed("expenses_page");
      }
    }




    showModalBottomSheet(isScrollControlled: true,isDismissible: false, enableDrag: false, context: ctx, builder: (_){

      onClosing: () {
        print('on closing');
      };

      void VoidFunc(){

      }
      void _listenTransections() async {
        if (!_isListening) {
          setState(() {

          });
          bool available = await _speech.initialize(
            onStatus: (val) => print('onStatus: $val'),
            onError: (val) => print('onError: $val'),
          );
          if (available) {
            setState(() => _isListening = true);
            _speech.listen(
              onResult: (val) => setState(() {
                _text = val.recognizedWords;
                NumberContraller=val.recognizedWords as TextEditingController;
                if (val.hasConfidenceRating && val.confidence > 0) {
                  _confidence = val.confidence;
                }
              }),
            );
          }
        } else {
          setState(() => _isListening = false);
          if(double.tryParse(_text)!=null){
                NumberContraller.text = _text;
          }
          setState(() {

          });
          _speech.stop();
          setState(() {

          });
        }
      }
      // DescriptionContraller
      void _listenTransectionsDescription() async {
        if (!_isListening) {
          setState(() {

          });
          bool available = await _speech.initialize(
            onStatus: (val) => print('onStatus: $val'),
            onError: (val) => print('onError: $val'),
          );
          if (available) {
            setState(() => _isListening = true);
            _speech.listen(
              onResult: (val) => setState(() {
                _textDescription = val.recognizedWords;
                DescriptionContraller=val.recognizedWords as TextEditingController;
                if (val.hasConfidenceRating && val.confidence > 0) {
                  _confidence = val.confidence;
                }
              }),
            );
          }
        } else {
          setState(() => _isListening = false);
          DescriptionContraller.text = _textDescription;
          setState(() {

          });
          _speech.stop();
          setState(() {

          });
        }
      }
      // _textDescription
      return
        Stack(
          children: [

            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Row(
                    children: [
                      SizedBox(width: 30,),
                      Flexible(
                        // scrollDirection: Axis.horizontal,
                          child: Text("Adding ${OneCategory.CategoryName} transaction amount",style: TextStyle(fontSize: 20,),)
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                              Text("${IsIncome? "Income":"Expense"} Amount : "),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                // child: AddMoreCategoriesMenu(),
                                child: Container(
                                    child: Text("Clear")
                                ),
                                onPressed: (){
                                  _text = '';
                                  CategoryAmountInput="";
                                  NumberContraller.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  primary: Colors.grey.shade300,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                            ],
                          ),
                        ],
                      ),

                      Container(
                          width: MediaQuery.of(context).size.width*0.80,
                          child: TextField(

                            controller: NumberContraller,
                            onTap: FiltersForTheApp.voiceRecognitionWant? _listenTransections : VoidFunc ,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            autocorrect: true,
                            autofocus: true,
                            maxLength: 8,
                            keyboardType: TextInputType.number,

                            onChanged: (val){
                              CategoryAmountInput=val;
                            },
                            decoration: InputDecoration(
                              icon: FiltersForTheApp.voiceRecognitionWant? FloatingActionButton(
                                mini:true,
                                onPressed: (){

                                  setState(() {

                                  });
                                },
                                child: Icon(Icons.mic_none),
                              ): Icon(
                                Icons.align_horizontal_left_sharp,
                              ),

                              labelText: _text == '' || double.tryParse(_text)==null ? "Enter the ${IsIncome? "Income":"Expense"} Amount": _text,
                              labelStyle: TextStyle(
                                color: Colors.indigo.withOpacity(0.3),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),



                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                              Text("Description : "),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                // child: AddMoreCategoriesMenu(),
                                child: Container(
                                    child: Text("Clear")
                                ),
                                onPressed: (){
                                  _textDescription = '';
                                  CategoryDescriptionInput="";
                                  DescriptionContraller.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  primary: Colors.grey.shade300,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              offset: const Offset(4, 4),
                              blurRadius: 8),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
                          color: Colors.white,
                          child: SingleChildScrollView(
                            padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                            child: TextField(
                              controller: DescriptionContraller,
                              onTap: FiltersForTheApp.voiceRecognitionWant? _listenTransectionsDescription : VoidFunc ,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                              ],
                              autocorrect: true,
                              maxLength: 100,
                              autofocus: true,
                              onChanged: (val){
                                CategoryDescriptionInput=val;
                              },
                              maxLines: 3,
                              style: TextStyle(
                                fontFamily: 'WorkSans',
                                fontSize: 16,
                                color: Color(0xFF313A44),
                              ),
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                  icon: FiltersForTheApp.voiceRecognitionWant? FloatingActionButton(
                                    mini:true,
                                    onPressed: (){

                                      setState(() {

                                      });
                                    },
                                    child: Icon(Icons.mic_none),
                                  ): Icon(
                                    Icons.align_horizontal_left_sharp,
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Description'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: Accounts
                            .map<DropdownMenuItem<String>>((String Value_Selected) {
                          return DropdownMenuItem<String>(
                            onTap: () => {

                            },

                            value: Value_Selected,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.height *0.03,
                                  height: MediaQuery.of(context).size.height *0.03,
                                  child: Image.asset("assets/IncomePagePics/all_accounts.png"),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.height *0.13,
                                  // height: MediaQuery.of(context).size.height *0.3,
                                  child: Center(
                                      child: Text(Value_Selected)
                                  ),
                                ),
                              ],
                            ),
                          );

                        }).toList(),
                        borderRadius: BorderRadius.circular(30),
                        dropdownColor: Colors.white70,
                      ),
                      DropdownButton<String>(
                        value: DateInt,
                        onChanged: (String? newValue) {
                          setState(() {
                            DateInt = newValue!;
                          });
                        },
                        items: DateList
                            .map<DropdownMenuItem<String>>((String Value_Selected) {
                          return DropdownMenuItem<String>(
                            onTap: () => {

                            },

                            value: Value_Selected,
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *0.04,
                                  // height: MediaQuery.of(context).size.height *0.03,
                                  child: Image.asset("assets/IncomePagePics/all_accounts.png"),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  // width: MediaQuery.of(context).size.height *0.13,
                                  // height: MediaQuery.of(context).size.height *0.3,
                                  child: Center(
                                      child: Text(Value_Selected)
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        borderRadius: BorderRadius.circular(30),
                        dropdownColor: Colors.white70,
                      ),
                      // SizedBox(width: MediaQuery.of(context).size.width *0.10,),
                    ],
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        // child: AddMoreCategoriesMenu(),
                        child: Container(
                            child: Text("Add amount")
                        ),
                        onPressed: (){
                          print(CategoryAmountInput);
                          print(CategoryDescriptionInput);
                          submitdata();
                          _text = '';
                          _textDescription = '';
                          // NumberContraller='' as TextEditingController;
                          // IsIncome? Navigator.of(context).pushReplacementNamed("incomes_page"):Navigator.of(context).pushReplacementNamed("expenses_page");
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.blue.shade500,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        // child: AddMoreCategoriesMenu(),
                        child: Text("Cancel"),
                        onPressed: (){
                          AddressofTheImagetemp="";
                          dropdownValue = FiltersForTheApp.Is_Cash;;
                          CategoryNameInput="";
                          CategoryAmountInput="";
                          DateInt="Today";
                          _text = '';
                          _textDescription = '';
                          // NumberContraller='' as TextEditingController;
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.red.shade300,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                ],
              ),
            )
          ],
        );
    });

  }

  void startAddNewCategories(BuildContext ctx,Categories OneCategory,bool IsIncome){
    int IDtemp; //
    String CategoryNametemp;  //8 CHARACTERS CAN BE ADDED
    String CategoryTypetemp;  //
    double CurrentSumtemp;
    // String AddressofTheImagetemp;  //
    Color ButtonColortemp;  //
    Color EndButtonColortemp;
    double TransectionAmounttemp; //
    bool IsRecurringtemp;
    DateTime Date=DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3))));
    // DateTime Date = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10)))))))))));
    TimeOfDay Time = TimeOfDay.now();

//148  175    392   423   451

    IsIncome? CategoryTypetemp = "Incomes" : CategoryTypetemp = "Expenses";
    IsIncome? IDtemp = Currently_Using_Income_Categories.length+1 : IDtemp = Currently_Using_Expense_Categories.length+1;
    IsIncome? ButtonColortemp = ColourListForIncomeCategories[IDtemp-1] : ButtonColortemp = ColourListForExpenseCategories[IDtemp-1];
    IsIncome? EndButtonColortemp = EndColourListForIncomeCategories[IDtemp-1] : EndButtonColortemp = EndColourListForExpenseCategories[IDtemp-1];
    TransectionAmounttemp =0;
    IsRecurringtemp = IsRefurringFunction();
// print('Click menu -> ${(int.parse(item.menuTitle))} ${(int.parse(item.menuTitle)).runtimeType}');
    Future submitdata()async{
      if (CategoryNameInput == "" || CategoryAmountInput == "" ||  AddressofTheImagetemp== "")
      {
        return;
      }
      else
      {
        CategoryNametemp = CategoryNameInput;
        CurrentSumtemp = double.parse(CategoryAmountInput);
        TransectionAmounttemp =CurrentSumtemp;
        var Temp = Categories(
          IDtemp,
          CategoryNametemp,
          CategoryTypetemp,
          CurrentSumtemp,
          AddressofTheImagetemp,
          ButtonColortemp,
          EndButtonColortemp,
          TransectionAmounttemp,
          IsRecurringtemp,
          "Null",
          DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3)))),
          // DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10))))))))))),
          TimeOfDay.now(),
          false,
          false,
        );

//148  175    392   423   451


        if(IsIncome){
          Currently_Using_Income_Categories.add(Temp);
          List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists([Temp]);
          IncomeCategory_addNote(StringBasedList[0],tableIncomesCaegories);
        }else{
          Currently_Using_Expense_Categories.add(Temp);
          List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists([Temp]);
          ExpenseCategory_addNote(StringBasedList[0],tableExpensesCaegories);
        }



        IDtemp = AllTransectionsForTheTime.length==0? 0: AllTransectionsForTheTime.length; //
        CategoryNametemp;
        CategoryTypetemp;
        CurrentSumtemp;
        AddressofTheImagetemp;
        ButtonColortemp;
        TransectionAmounttemp;
        IsRefurringFunction();
        String AccountDatatemp = dropdownValue;
        CurrentSumtemp=double.parse(CategoryAmountInput);
        TransectionAmounttemp =CurrentSumtemp;
        DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3))));
        // DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10)))))))))));
        TimeOfDay Timetemp = TimeOfDay.now();

//148  175    392   423   451


        var TempTransection = Categories(
          IDtemp,
          CategoryNametemp,
          CategoryTypetemp,
          CurrentSumtemp,
          AddressofTheImagetemp,
          ButtonColortemp,
          EndButtonColortemp,
          TransectionAmounttemp,
          IsRecurringtemp,
          AccountDatatemp,
          Datetemp,
          Timetemp,
          false,
          false,
        );

        AllTransectionsForTheTime.add(TempTransection);

        List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists([TempTransection]);
        AllTransections_addNote(StringBasedList[0],tableAllTransections);



        if(!IsIncome){
          var TempTransection = Categories(
            BudgetValues.length+1,
            CategoryNametemp,
            CategoryTypetemp,
            0,
            AddressofTheImagetemp,
            ButtonColortemp,
            EndButtonColortemp,
            0,
            IsRecurringtemp,
            AccountDatatemp,
            Datetemp,
            Timetemp,
            false,
            false,
          );

          BudgetValues.add(TempTransection);

          List <Note> StringBasedList = await UserSecureStorage.set_ToStringConverted_Lists([TempTransection]);
          Budgets_addNote(StringBasedList[0],tableBudgets);
        }


        dropdownValue = FiltersForTheApp.Is_Cash;;
        AddressofTheImagetemp="";
        CategoryNameInput="";
        CategoryAmountInput="";
        DateInt="Today";
        Navigator.of(context).pop();
        // OneCategory.CategoryType=="Incomes"? Navigator.of(context).pushReplacementNamed("incomes_page"): Navigator.of(context).pushReplacementNamed("expenses_page");
        IsIncome? Navigator.of(context).pushReplacementNamed("incomes_page"):Navigator.of(context).pushReplacementNamed("expenses_page");

      }


    }


    showModalBottomSheet(isDismissible: true, enableDrag: true, context: ctx, builder: (_){
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Adding new Category",style: TextStyle(fontSize: 20,),),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                    Text("Category name : "),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.15,
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.80,
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                        ],
                        autocorrect: true,
                        maxLength: 12,
                        autofocus: true,
                        onChanged: (val){
                          CategoryNameInput=val;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.align_horizontal_left_sharp,
                          ),

                          labelText: "Enter the category name - Required",
                          labelStyle: TextStyle(
                            color: Colors.indigo.withOpacity(0.3),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                    Text("Current amount : "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.35,
                      height: MediaQuery.of(context).size.width*0.15,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.80,
                        child: TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 8,
                          onChanged: (val){
                            CategoryAmountInput=val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.align_horizontal_left_sharp,
                            ),

                            labelText: "Required",
                            labelStyle: TextStyle(
                              color: Colors.indigo.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ElevatedButton(
                        key: btnKey3,
                        // child: AddMoreCategoriesMenu(),
                        child: Text("Icon Select"),
                        onPressed: onDismissOnlyBeCalledOnce,
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: ColourList.IconSelectBackground,
                          shadowColor: Colors.black,
                        ),
                      ),

                    ),

                  ],
                ),
              ],
            ),
            // SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: Accounts
                      .map<DropdownMenuItem<String>>((String Value_Selected) {
                    return DropdownMenuItem<String>(
                      onTap: () => {

                      },

                      value: Value_Selected,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.04,
                            height: MediaQuery.of(context).size.height *0.03,
                            child: Image.asset("assets/IncomePagePics/all_accounts.png"),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            // width: MediaQuery.of(context).size.height *0.13,
                            // height: MediaQuery.of(context).size.height *0.3,
                            child: Center(
                                child: Text(Value_Selected)
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white70,
                ),
                DropdownButton<String>(
                  value: DateInt,
                  onChanged: (String? newValue) {
                    setState(() {
                      DateInt = newValue!;
                    });
                  },
                  items: DateList
                      .map<DropdownMenuItem<String>>((String Value_Selected) {
                    return DropdownMenuItem<String>(
                      onTap: () => {

                      },

                      value: Value_Selected,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.04,
                            // height: MediaQuery.of(context).size.height *0.03,
                            child: Image.asset("assets/IncomePagePics/all_accounts.png"),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            // width: MediaQuery.of(context).size.height *0.13,
                            // height: MediaQuery.of(context).size.height *0.3,
                            child: Center(
                                child: Text(Value_Selected)
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white70,
                ),
                // SizedBox(width: MediaQuery.of(context).size.width *0.10,),
              ],
            ),

            SizedBox(width: MediaQuery.of(context).size.width*0.05,),












            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // child: AddMoreCategoriesMenu(),
                  child: Container(
                      child: Text("Add New Category")
                  ),
                  onPressed: (){
                    submitdata();

                    },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Colors.blue.shade500,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                    ),
                  ),
                ),
                ElevatedButton(
                  // child: AddMoreCategoriesMenu(),
                  child: Text("Cancel"),
                  onPressed: (){
                    AddressofTheImagetemp="";
                    dropdownValue = 'All Account';
                    CategoryNameInput="";
                    CategoryAmountInput="";
                    DateInt="Today";
                    Navigator.of(context).pop();

                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('Canceled'),
                      duration: const Duration(seconds: 1),
                      backgroundColor: Colors.blueGrey,
                    ));


                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    primary: Colors.red.shade300,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topRight: Radius.circular(MediaQuery.of(context).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(context).size.height*0.05)),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
          ],
        ),
      );
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();

  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    print(ID);
    if(ID==-1)
    {
      startAddNewCategories(context , OneCategory, IsIncome);
      build(context);
    }
    else {
      AddIncomeExpenses(context,OneCategory, IsIncome);
    }
    //asddasdas

  }



  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ButtonColor,
      ),
      height: MediaQuery.of(context).size.width * 0.12,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Image.asset(Address)
  );


  void onDismissOnlyBeCalledOnce() {
    menu = PopupMenu(
      context: context,
      config: MenuConfig(
        backgroundColor: ColourList.IconSelectBackground,
        lineColor: Colors.tealAccent,

      ),
      items: [
        // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
        MenuItem(title: IconSelectionMenu[0].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4), child: Image.asset(IconSelectionMenu[0].Address))),
        MenuItem(title: IconSelectionMenu[1].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[1].Address))),
        MenuItem(title: IconSelectionMenu[2].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[2].Address))),
        MenuItem(title: IconSelectionMenu[3].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[3].Address))),
        MenuItem(title: IconSelectionMenu[4].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[4].Address))),
        MenuItem(title: IconSelectionMenu[5].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[5].Address))),
        MenuItem(title: IconSelectionMenu[6].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[6].Address))),
        MenuItem(title: IconSelectionMenu[7].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[7].Address))),
        MenuItem(title: IconSelectionMenu[8].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[8].Address))),
        MenuItem(title: IconSelectionMenu[9].ID.toString() ,  image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[9].Address))),
        MenuItem(title: IconSelectionMenu[10].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[10].Address))),
        MenuItem(title: IconSelectionMenu[11].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[11].Address))),
        MenuItem(title: IconSelectionMenu[12].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[12].Address))),
        MenuItem(title: IconSelectionMenu[13].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[13].Address))),
        MenuItem(title: IconSelectionMenu[14].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[14].Address))),
        MenuItem(title: IconSelectionMenu[15].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[15].Address))),
        MenuItem(title: IconSelectionMenu[16].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[16].Address))),
        MenuItem(title: IconSelectionMenu[17].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[17].Address))),
        MenuItem(title: IconSelectionMenu[18].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[18].Address))),
        MenuItem(title: IconSelectionMenu[19].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[19].Address))),
        MenuItem(title: IconSelectionMenu[20].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[20].Address))),
        MenuItem(title: IconSelectionMenu[21].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[21].Address))),
        MenuItem(title: IconSelectionMenu[22].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[22].Address))),
        MenuItem(title: IconSelectionMenu[23].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[23].Address))),
        MenuItem(title: IconSelectionMenu[24].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[24].Address))),
        MenuItem(title: IconSelectionMenu[25].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[25].Address))),
        MenuItem(title: IconSelectionMenu[26].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[26].Address))),
        MenuItem(title: IconSelectionMenu[27].ID.toString() , image: Container(height: 5, width: 5, margin: EdgeInsets.all(4),child: Image.asset(IconSelectionMenu[27].Address))),
      ],
      onClickMenu: onClickMenu,
      onDismiss: onDismiss,
    );
    menu.show(widgetKey: btnKey3);
  }


}






// abstract class MenuItemProvider {
//   String get menuTitle;
//   dynamic get menuUserInfo;
//   Widget? get menuImage;
//   TextStyle get menuTextStyle;
//   TextAlign get menuTextAlign;
// }

/// Default menu item
class MenuItem extends MenuItemProvider {
  Widget? image;
  String title;
  var userInfo; // 额外的菜单荐信息
  TextStyle textStyle;
  TextAlign textAlign;

  MenuItem({
    this.title = "",
    this.image,
    this.userInfo,
    this.textStyle = const TextStyle(
      color: Color(0xffc5c5c5),
      fontSize: 10.0,
    ),
    this.textAlign = TextAlign.center,
  });

  factory MenuItem.forList({
    required String title,
    Widget? image,
    dynamic userInfo,
    TextStyle textStyle = const TextStyle(
      color: Color(0xFF181818),
      fontSize: 10.0,
    ),
    TextAlign textAlign = TextAlign.center,
  }) {
    return MenuItem(
      title: title,
      image: image,
      userInfo: userInfo,
      textAlign: textAlign,
      textStyle: textStyle,
    );
  }

  @override
  Widget? get menuImage => image;

  @override
  String get menuTitle => title;

  @override
  dynamic get menuUserInfo => userInfo;

  @override
  TextStyle get menuTextStyle => textStyle;

  @override
  TextAlign get menuTextAlign => textAlign;
}

