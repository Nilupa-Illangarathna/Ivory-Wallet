import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/category_types.dart';
import '../Classes/All Contralling Dart Files/TransectionsClass.dart';
import '../Classes/colors.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import 'package:intl/intl.dart';
import '../DataFiles/TransectionRelated/transectionTile.dart';
import '../Widgets/curved_bottom_navigation_bar.dart';
import '../Classes/enums.dart';
import '../Classes/AccountsClass.dart';
import '../DataFiles/Budget related/constants.dart';
import '../Data_Load_From_DB/AllTransectionDB/AllTransectionsFunctions.dart';
import '../Data_Load_From_DB/notes.dart';
import '../Shared_Preferences_DB/LoadingClass.dart';
import 'package:share/share.dart';


void doNothing(BuildContext context) {}



class TransectionsList extends StatefulWidget {
  const TransectionsList({
    Key? key,
  }) : super(key: key);

  @override
  State<TransectionsList> createState() => _TransectionsListState();
}

class _TransectionsListState extends State<TransectionsList> {
  var ColourList =ColorsClass();

  List <Categories> SelectedTraansectionsForTiles = GetFilteredTransectionsList();

  String dropdownValue = FiltersForTheApp.Is_Cash;
  String AccountValue = FiltersForTheApp.IncomeOrExpense;
  String FavoritesOrBadSets = FiltersForTheApp.ShowFavoritesOrBadSets;


  String DateInt="Today";


  String AddressofTheImagetemp="";
  String CategoryNameInput="";
  String CategoryAmountInput="";

  bool IsRefurringFunction(){
    return false;
  }



  Widget ListViewReturn(int index,Categories item,bool IsFirst,bool IsLast)
  {
    return item.TransectionAmount>0? (Column(
      children: [
        IsFirst? Container(height: MediaQuery.of(context).size.height * 0.30,) : Container(height: MediaQuery.of(context).size.height * 0.0,),

        Slidable(
            actionPane: SlidableDrawerActionPane(),
            closeOnScroll: true,

            actions: <Widget> [
              IconSlideAction(
                caption: "Delete",
                color: Colors.red[900],
                icon: Icons.delete,
                closeOnTap: false,
                onTap: () => onDismissed(item,index,TransectionsSlidableActions.delete),
              ),
              IconSlideAction(
                caption: "share",
                color: Colors.blue[800],
                icon: Icons.share,
                closeOnTap: false,
                onTap: () => onDismissed(item,index,TransectionsSlidableActions.share),
              ),
              IconSlideAction(
                caption: "Edit",
                color: Colors.limeAccent,
                icon: Icons.edit,
                closeOnTap: false,
                onTap: () => onDismissed(item,index,TransectionsSlidableActions.edit),
              ),
            ],
            secondaryActions: <Widget> [
              IconSlideAction(
                caption: "Favorite",
                color: Colors.green[800],
                icon: item.IsFavorite? Icons.favorite: Icons.favorite_border,
                closeOnTap: false,
                onTap: () => onDismissed(item,index,TransectionsSlidableActions.favorite),
              ),
              IconSlideAction(
                caption: "Mention bad",
                color: Colors.pink[900],
                // icon: Icons.flag,
                icon: item.IsBadTransection? Icons.thumb_down: Icons.thumb_up,
                closeOnTap: false,
                onTap: () => onDismissed(item,index,TransectionsSlidableActions.mention_bad),
              ),
            ],
            child: TransectionTiles(index,item)
        ),
        IsLast? Container(height: MediaQuery.of(context).size.height * 0.10,) : Container(height: MediaQuery.of(context).size.height * 0.0,),
      ],
    ))
        :
    Container(height: 0,width: 0,);
  }



  Future<void> onDismissed(Categories item, int index,TransectionsSlidableActions action) async {

    if(action==TransectionsSlidableActions.delete)
      {
        for(int i=0;i<AllTransectionsForTheTime.length;i++)
          {
            if(AllTransectionsForTheTime[i].ID==item.ID)
              {
                AllTransectionsForTheTime.removeAt(i);
              }
          }

        AllTransections_deleteNote(item.ID,tableAllTransections);



        Navigator.of(context).pushReplacementNamed("transections_page");



      }
    else if(action==TransectionsSlidableActions.share)
    {
      String SharingText="""Sharing transaction data
Transaction category : ${SelectedTraansectionsForTiles[index].CategoryName}
As an : ${SelectedTraansectionsForTiles[index].CategoryType}
Transaction amount : ${FiltersForTheApp.CurrentCurrencyType} ${SelectedTraansectionsForTiles[index].TransectionAmount}
Was done using : ${SelectedTraansectionsForTiles[index].AccountData} payment
Date of Transaction : ${DateFormat.yMMMMEEEEd().format(SelectedTraansectionsForTiles[index].Date)}
Transaction recorded time : ${DateFormat.jms().format(SelectedTraansectionsForTiles[index].Date)}
Recorded ${SelectedTraansectionsForTiles[index].IsFavorite? "as": "not as"} a favorite
Recorded ${SelectedTraansectionsForTiles[index].IsBadTransection? "as": "not as"} a must considered transaction
${SelectedTraansectionsForTiles[index].IsRecurring? "Recurring transaction type":"Not recurring transection type"}
""";
      Share.share(SharingText);




    }



    if(action==TransectionsSlidableActions.edit)
    {
      Categories Temperory = await UpdateIncomeExpenses(context, item ,true);
      SelectedTraansectionsForTiles[index]=Temperory;
      List <Note> SendIn= await UserSecureStorage.set_ToStringConverted_Lists([SelectedTraansectionsForTiles[index]]);
      AllTransections_updateNote(SendIn[0],tableAllTransections);

      dropdownValue = 'All Account';
      AddressofTheImagetemp="";
      CategoryNameInput="";
      CategoryAmountInput="";
      DateInt="Today";
      setState(() {});
    }



    if(action==TransectionsSlidableActions.favorite)
    {
      SelectedTraansectionsForTiles[index].IsFavorite==false? SelectedTraansectionsForTiles[index].IsFavorite=true : SelectedTraansectionsForTiles[index].IsFavorite=false;
      setState(() {});
      List <Note> SendIn= await UserSecureStorage.set_ToStringConverted_Lists([SelectedTraansectionsForTiles[index]]);
      AllTransections_updateNote(SendIn[0],tableAllTransections);
    }
    if(action==TransectionsSlidableActions.mention_bad)
    {
      SelectedTraansectionsForTiles[index].IsBadTransection==false? SelectedTraansectionsForTiles[index].IsBadTransection=true : SelectedTraansectionsForTiles[index].IsBadTransection=false;
      setState(() {});
      List <Note> SendIn= await UserSecureStorage.set_ToStringConverted_Lists([SelectedTraansectionsForTiles[index]]);
      AllTransections_updateNote(SendIn[0],tableAllTransections);
    }
  }


  Future UpdateIncomeExpenses(BuildContext ctx, Categories OneCategory ,bool IsIncome) async{
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
   TimeOfDay Timetemp = TimeOfDay.now();

    Future submitdata() async{
      if (CategoryAmountInput == "" || dropdownValue == 'All Account')
      {
        return;

      }
      else
      {
        AccountDatatemp = dropdownValue;
        CurrentSumtemp=double.parse(CategoryAmountInput);
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
          Timetemp,
          false,
          false,
        );

        for(int i=0;i<AllTransectionsForTheTime.length;i++){
          if(OneCategory.ID==AllTransectionsForTheTime[i].ID){
            AllTransectionsForTheTime[i]=Temp;
          }
        }

        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed("transections_page");
        return Temp;


      }
    }




    showModalBottomSheet(isDismissible: true, enableDrag: true, context: ctx, builder: (_){
      return   Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Row(
              children: [
                SizedBox(width: 30,),
                Flexible(
                    child: Text("Editing ${OneCategory.CategoryType=="Incomes"? "Incomes":"Expenses"} transaction",style: TextStyle(fontSize: 20,),)
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.10,),
                    Text("${OneCategory.CategoryType=="Incomes"? "Incomes":"Expenses"} Amount : "),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width*0.80,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      autocorrect: true,
                      autofocus: true,
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                      onChanged: (val){
                        CategoryAmountInput=val; //////////////////////////////////////////////////////////////////////////////////////////////
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.align_horizontal_left_sharp,
                        ),

                        labelText: "Current value : ${OneCategory.TransectionAmount}",
                        labelStyle: TextStyle(
                          color: Colors.indigo.withOpacity(0.3),
                        ),
                      ),
                    )
                ),
              ],
            ),



            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!; ///////////////////////////////////////////////////////////////////////////////////////////
                    });
                  },
                  items: AccountsToShow
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
                      DateInt = newValue!;///////////////////////////////////////////////////////////////////////////////////////////////////////
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
                            child: Image.asset("assets/IncomePagePics/all_accounts.png"),
                          ),
                          SizedBox(width: 10,),
                          Container(
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
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Container(
                      child: Text("Edit Transection")
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
                  child: Text("Cancel"),
                  onPressed: (){
                    AddressofTheImagetemp="";
                    dropdownValue = 'All Account';
                    CategoryNameInput="";
                    CategoryAmountInput="";
                    DateInt="Today";
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
      );
    });

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#F7F7F7")
              // color: Colors.white,
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,


                child: Scrollbar(
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: SelectedTraansectionsForTiles.length,
                    itemBuilder: (context,index){

                      final item = SelectedTraansectionsForTiles[index];
                      return index==0? ListViewReturn(index,item,true,false):(index==SelectedTraansectionsForTiles.length-1? ListViewReturn(index,item,false,true):ListViewReturn(index,item,false,false));
                    },
                  ),
                ),

              ),
            ],
          ),

          BottomNavBarV2(false),
          Stack(
            children: [

            ],
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0),bottomRight: Radius.circular(35.0)),
              boxShadow: [kBoxShadow],
            ),
            margin: EdgeInsets.only(right: 0, left:0 , bottom: 0, top: 0),
            padding: EdgeInsets.all(6),
            child:Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),

                Text(
                  "Transactions",
                  style: TextStyle(
                    fontFamily: "arlrdbd",
                    fontWeight: FontWeight.w800,
                    color: Colors.black.withOpacity(0.7),
                    fontSize: MediaQuery.of(context).size.width*0.08,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),

                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    FiltersForTheApp.AccountType = newValue!;
                    dropdownValue = FiltersForTheApp.AccountType;
                    Navigator.of(context).pushReplacementNamed("transections_page");
                  },
                  items: Accounts
                      .map<DropdownMenuItem<String>>((String Value_Selected) {
                    return DropdownMenuItem<String>(

                      onTap: () => {

                      },

                      value: Value_Selected,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.70,
                            height: MediaQuery.of(context).size.width *0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *0.05,
                                height: MediaQuery.of(context).size.width *0.09,
                                child: Container(
                                  child: Image.asset("assets/IncomePagePics/all_accounts.png"),

                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: MediaQuery.of(context).size.height *0.13,
                                child: Center(
                                    child: Text(Value_Selected,style: TextStyle(color: Colors.black),)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white70,
                ),

                SizedBox(width: 20,),


                DropdownButton<String>(
                  value: AccountValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      FiltersForTheApp.IncomeOrExpense = newValue!;
                      Navigator.of(context).pushReplacementNamed("transections_page");
                    });
                  },
                  items: IncomesOrExpenses
                      .map<DropdownMenuItem<String>>((String Value_Selected) {
                    return DropdownMenuItem<String>(

                      onTap: () => {

                      },

                      value: Value_Selected,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.70,
                            height: MediaQuery.of(context).size.width *0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *0.05,
                                height: MediaQuery.of(context).size.width *0.09,
                                child: Container(
                                  child: Image.asset("assets/IncomePagePics/all_accounts.png"),

                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: MediaQuery.of(context).size.height *0.13,
                                child: Center(
                                    child: Text(Value_Selected,style: TextStyle(color: Colors.black),)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white70,
                ),

                SizedBox(width: 20,),

                DropdownButton<String>(
                  value: FavoritesOrBadSets,
                  onChanged: (String? newValue) {
                    setState(() {
                      FiltersForTheApp.ShowFavoritesOrBadSets = newValue!;
                      Navigator.of(context).pushReplacementNamed("transections_page");
                    });
                  },
                  items: FavoriteSelection
                      .map<DropdownMenuItem<String>>((String Value_Selected) {
                    return DropdownMenuItem<String>(

                      onTap: () => {

                      },

                      value: Value_Selected,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.70,
                            height: MediaQuery.of(context).size.width *0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width *0.05,
                                height: MediaQuery.of(context).size.width *0.09,
                                child: Container(
                                  child: Image.asset("assets/IncomePagePics/all_accounts.png"),

                                ),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: MediaQuery.of(context).size.height *0.13,
                                child: Center(
                                    child: Text(Value_Selected,style: TextStyle(color: Colors.black),)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white70,
                ),

                SizedBox(width: 20,),

              ],
            ),
          ),



        ],
      ),
    );
  }
}


Widget TransectionTiles(int index,Categories item) => TransectionTile(item);