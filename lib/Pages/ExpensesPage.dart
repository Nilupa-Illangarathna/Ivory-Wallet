import 'package:flutter/material.dart';
import '../Classes/colors.dart';
import '../Classes/All Contralling Dart Files/category_types.dart';
import '../Widgets/four_category_buttons_in_a_row.dart';
import '../Widgets/curved_bottom_navigation_bar.dart';
import '../Classes/AccountsClass.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../Widgets/Charts/dougnutChartForOverview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Classes/ChartData.dart';

class ExpensesPage extends StatefulWidget {
  bool IsIncome;
  ExpensesPage(this.IsIncome);

  @override
  _ExpensesPageState createState() => _ExpensesPageState(IsIncome);
}

class _ExpensesPageState extends State<ExpensesPage> {

  bool IsIncome;
  _ExpensesPageState(this.IsIncome);

  var ColourList =ColorsClass();
  String dropdownValue = FiltersForTheApp.AccountType;

  List<DoughnutChartData> ExpensechartData = DoughnutChartDataReturn(ExpenseFilteredCategoryValuesforincomeandexpenses(Currently_Using_Expense_Categories));



  @override
  Widget build(BuildContext context) {
    ExpensechartData = DoughnutChartDataReturn(ExpenseFilteredCategoryValuesforincomeandexpenses(Currently_Using_Expense_Categories));
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColourList.HomePageAppBarColor,
        toolbarHeight: MediaQuery.of(context).size.height *0.15,
        elevation: 40,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.only(bottomRight: Radius.circular(70),/*bottomLeft: Radius.circular(70)*/)
        ),
        title: Container(
            width: MediaQuery.of(context).size.width *1,
            height: MediaQuery.of(context).size.height *0.14,
            // color: Colors.brown.withOpacity(0.12),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          FiltersForTheApp.AccountType = newValue!;
                        });
                        Navigator.of(context).pushReplacementNamed("expenses_page");
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
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    // SizedBox(width: 20?,)
                  ],
                ),
                SizedBox(height: 5,),
                Text("Expenses",
                  style: TextStyle(
                    fontFamily: "arlrdbd",
                    fontWeight: FontWeight.w800,
                    color: Colors.white70,
                    fontSize: MediaQuery.of(context).size.width*0.08,
                  ),
                ),
              ],
            )),
      ),





      body: Stack(
          children: [
            //Background
            Container(
              color: Colors.grey.withOpacity(0.1),
            ),
            //Middle button
            Container(
              height: (MediaQuery.of(context).size.height-80) * 0.80,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.0),
              child: Stack(
                children: [
                  Center(
                    child: SfCircularChart(
                      // Sets 15 logical pixels as margin for all the 4 sides.
                        margin: EdgeInsets.all(0),
                        series: <CircularSeries>[
                          // Renders doughnut chart
                          DoughnutSeries<DoughnutChartData, String>(
                              radius: "56%",
                              // innerRadius: "100%",
                              dataSource: ExpensechartData,
                              pointColorMapper:(DoughnutChartData data,  _) => data.color,
                              xValueMapper: (DoughnutChartData data, _) => data.x,
                              yValueMapper: (DoughnutChartData data, _) => data.y
                          )
                        ]
                    ),
                  ),
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.0 , 0.3, 1.0],
                                colors: [Colors.white, Colors.white, Colors.grey]
                            )
                        ),
                        child: RawMaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('incomes_page');
                            setState(() {
                              IsIncome=!IsIncome;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child:Center(
                                child:Text("Incomes" , style: TextStyle( fontSize: 17,),)
                            ),
                          ),
                          shape: new CircleBorder(),
                          elevation: 2.0,
                          fillColor: Colors.white,
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                        )
                    ),
                  ),

                  Container(
                    height: (MediaQuery.of(context).size.height-80) * 0.80,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.blue.withOpacity(0.4), ////////////////////////////Background///////////
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        new FourCategoryButtonsInARow(IsIncome,Currently_Using_Expense_Categories, 0 ),
                        new TwoCategoryButtonsInARow(IsIncome,Currently_Using_Expense_Categories, 0 ),
                        new TwoCategoryButtonsInARow(IsIncome,Currently_Using_Expense_Categories, 1 ),
                        new FourCategoryButtonsInARow(IsIncome,Currently_Using_Expense_Categories, 1 ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            BottomNavBarV2(false),
          ]
      ),
    );
  }
}


List<DoughnutChartData> DoughnutChartDataReturn(List <Categories> ListOfAmounts)
{
  final List<DoughnutChartData> chartData = [];

  double tempsum=0;
  for(int i=0;i<ListOfAmounts.length;i++)
  {
    tempsum+=ListOfAmounts[i].CurrentSum;
  }
  for(int i=0;i<ListOfAmounts.length;i++)
  {
    chartData.add(DoughnutChartData(ListOfAmounts[i].CategoryName, (ListOfAmounts[i].CurrentSum).toDouble(), ((ListOfAmounts[i].CurrentSum).toDouble()/tempsum)*100 , ListOfAmounts[i].ButtonColor));
  }
  return chartData;
}