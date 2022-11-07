// import 'package:flutter/material.dart';
// import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/TransectionsClass.dart';
// import '../Classes/colors.dart';
// import '../Classes/All Contralling Dart Files/category_types.dart';
// import '../Widgets/four_category_buttons_in_a_row.dart';
// import '../Widgets/curved_bottom_navigation_bar.dart';
// import '../Classes/AccountsClass.dart';
// import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import '../Classes/ChartData.dart';
// import '../Widgets/Charts/dougnutChartForOverview.dart';
// import '../Widgets/Charts/radialBarChartForOverview.dart';
// import '../Widgets/Charts/stackedWeeklyBarChart.dart';
// import '../Widgets/Charts/predictorBubbleChart.dart';
// import 'package:intl/intl.dart';
// import '../DataFiles/Budget related/constants.dart';
// import '../Classes/All Contralling Dart Files/BudgetsList.dart';
// import '../Widgets/Three_gauge_in_a_row.dart';
// import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
//
//
//
// class OverviewPage extends StatefulWidget {
//   // const IncomesPage({Key? key}) : super(key: key);
//
//
//   @override
//   _OverviewPageState createState() => _OverviewPageState();
// }
//
// class _OverviewPageState extends State<OverviewPage> {
//
//
//   var ColourList =ColorsClass();
//
//   String dropdownValue = FiltersForTheApp.AccountType;
//   String AccountValue = FiltersForTheApp.IncomeOrExpense;
//
//   double elevationvalue=FiltersForTheApp.elevationvalue;
//
//   final TileHeightAllAccounts=0.600;
//   final TileWidthAllAccounts =0.440;
//   final TileHeightIncomeAndExpenses=0.470;
//   final TileWidthIncomeAndExpenses =0.470;
//
//   final TileHeightStackedWeeklyBarChart = 0.90;
//   final TileWidthStackedWeeklyBarChart = 0.90;
//
//   final List<DoughnutChartData> IncomePiechartData = DoughnutChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
//   final List<DoughnutChartData> ExpensePiechartData = DoughnutChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));
//   final List<RadialBarChartData> IncomeRadialBarchartData = RadialBarChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
//   final List<RadialBarChartData> ExpenseRadialBarchartData = RadialBarChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));
//
//   @override
//   Widget build(BuildContext context) {
//
//     for(int i=0;i<ExpensePiechartData.length;i++){
//       print(ExpensePiechartData[i].y);
//     }
//
//     List <Categories> ExpenseTable = OverviewTableExpense();
//     List <Categories> IncomeTable = OverviewTableIncome();
//
//
//
//     return Scaffold(
//       body: Stack(
//           children: [
//             //Background
//             Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: ColourList.OverviewBackgroundColor,
//             ),
//             SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(height: MediaQuery.of(context).size.height * 0.23,),
//
//                   // WeeklySplineBarChart(0.96,0.4,"Expenses"),
//
//
// //All Accounts
//                   AccountValue=="All Types"?
//                   Container(
//                     // height: MediaQuery.of(context).size.width*0.65,
//                     // width: MediaQuery.of(context).size.width*1.70,
//                     child: SingleChildScrollView(
//                       physics: BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Material(
//                             elevation: elevationvalue,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                             child: Container(
//                               // height: MediaQuery.of(context).size.width-20,
//                               width: MediaQuery.of(context).size.width*0.98,
//                               padding: EdgeInsets.symmetric(vertical: 10,),
//                               // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                               decoration: BoxDecoration(
//                                 color: ColourList.OverviewChartBackground,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                                 boxShadow: [kBoxShadow],
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//
//                                   Topic1(elevationvalue),
//
//                                   SizedBox(height: 10,),
//
//                                   NetTodayandMonth(IncomeTable,ExpenseTable,elevationvalue,TileWidthAllAccounts),
//
//                                   SizedBox(height: 10,),
//
//                                   ExpenseandIncomeTableSTL("Income",IncomeTable,elevationvalue,TileWidthAllAccounts),
//
//                                   SizedBox(height: 10,),
//
//                                   ExpenseandIncomeTableSTL("Expense",ExpenseTable,elevationvalue,TileWidthAllAccounts),
//
//                                   SizedBox(height: 10,),
//
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       SizedBox(width: 10,),
//
//                                       AllTransectionsForTheTime.length==0 || !CheckTransectionAvailability("Incomes")?
//                                       Material(
//                                         elevation: elevationvalue,
//                                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         child: Container(
//                                           height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//                                           width: MediaQuery.of(context).size.width*TileWidthAllAccounts,
//                                           decoration: BoxDecoration(
//                                               color: ColourList.OverviewChartBackground,
//                                               borderRadius: BorderRadius.all(Radius.circular(20))
//                                           ),),
//                                       ):DoughnutChartForOverview(IncomePiechartData,"Incomes",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                       SizedBox(width: 10,),
//                                       AllTransectionsForTheTime.length==0 || !CheckTransectionAvailability("Expenses")?
//                                       Material(
//                                         elevation: elevationvalue,
//                                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                                         child: Container(
//                                           height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//                                           width: MediaQuery.of(context).size.width*TileWidthAllAccounts,
//                                           decoration: BoxDecoration(
//                                               color: ColourList.OverviewChartBackground,
//                                               borderRadius: BorderRadius.all(Radius.circular(20))
//                                           ),),
//                                       ):DoughnutChartForOverview(ExpensePiechartData,"Expense",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                       SizedBox(width: 10,),
//                                     ],
//                                   ),
//
//                                   SizedBox(height: 10,),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       SizedBox(width: 10,),
//                                       RadialBarChartForOverview(IncomeRadialBarchartData,"Incomes",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileWidthAllAccounts),
//                                       SizedBox(width: 10,),
//                                       RadialBarChartForOverview(ExpenseRadialBarchartData,"Expense",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileWidthAllAccounts),
//                                       SizedBox(width: 10,),
//                                       ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(height: 10,),
//
//                           Gauges(elevationvalue),
//
//                           SizedBox(height: 10,),
//
//                           Material(
//                             elevation: elevationvalue,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                             child: Container(
//                               // height: MediaQuery.of(context).size.width-20,
//                               width: MediaQuery.of(context).size.width*0.98,
//                               padding: EdgeInsets.symmetric(vertical: 10,),
//                               // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                               decoration: BoxDecoration(
//                                   color: ColourList.OverviewChartBackground,
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(height: 10,),
//                                   Topic3(elevationvalue),
//                                   SizedBox(height: 10,),
//                                   StackWeeklyBarChart(0.96,0.4,"Incomes"),
//                                   SizedBox(height: 10,),
//                                   StackWeeklyBarChart(0.96,0.4,"Expenses"),
//
//                                   SizedBox(height: 10,),
//
//                                   // WeeklySplineBarChart(0.96,0.4,"Incomes"),
//                                   // SizedBox(height: 10,),
//                                   // WeeklySplineBarChart(0.96,0.4,"Expenses"),
//                                   // SizedBox(height: 10,),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//
//
//                         ],
//                       ),
//                     ),)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//                       :
// //Incomes
//                   (
//                       (AccountValue=="Incomes"?
//                           Column(
//                             children: [
//                               Material(
//                                 elevation: elevationvalue,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                                 child: Container(
// // height: MediaQuery.of(context).size.width-20,
//                                   width: MediaQuery.of(context).size.width*0.98,
//                                   padding: EdgeInsets.symmetric(vertical: 10,),
// // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                                   decoration: BoxDecoration(
//                                       color: ColourList.OverviewChartBackground,
//                                       borderRadius: BorderRadius.all(Radius.circular(20))
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(height: 10,),
//
//                                       Topic1(elevationvalue),
//
//                                       SizedBox(height: 10,),
//
//                                       ExpenseandIncomeTableSTL("Income",IncomeTable,elevationvalue,TileWidthAllAccounts),
//
//                                       SizedBox(height: 10,),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//                                           AllTransectionsForTheTime.length==0 || !CheckTransectionAvailability("Incomes")?
//                                           Container(
//                                             height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//                                             width: MediaQuery.of(context).size.width*TileWidthIncomeAndExpenses,
//                                             decoration: BoxDecoration(
//                                                 color: ColourList.OverviewChartBackground,
//                                                 borderRadius: BorderRadius.all(Radius.circular(20))
//                                             ),):DoughnutChartForOverview(IncomePiechartData,"Incomes",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                           RadialBarChartForOverview(IncomeRadialBarchartData,"Incomes",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                         ],
//                                       ),
//                                       SizedBox(height: 10,),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: 20,),
//                               Material(
//                                 elevation: elevationvalue,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                                 child: Container(
// // height: MediaQuery.of(context).size.width-20,
//                                   width: MediaQuery.of(context).size.width*0.98,
//                                   padding: EdgeInsets.symmetric(vertical: 10,),
// // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                                   decoration: BoxDecoration(
//                                       color: ColourList.OverviewChartBackground,
//                                       borderRadius: BorderRadius.all(Radius.circular(20))
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(height: 10,),
//                                       Topic3(elevationvalue),
//                                       SizedBox(height: 10,),
//                                       StackWeeklyBarChart(0.96,0.5,"Incomes"),
//                                       SizedBox(height: 10,),
//                                      /* WeeklySplineBarChart(0.96,0.5,"Incomes"),
//                                       SizedBox(height: 10,),*/
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                           :
//                       Column(
//                         children: [
//                           Material(
//                             elevation: elevationvalue,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                             child: Container(
// // height: MediaQuery.of(context).size.width-20,
//                               width: MediaQuery.of(context).size.width*0.98,
//                               padding: EdgeInsets.symmetric(vertical: 10,),
// // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                               decoration: BoxDecoration(
//                                   color: ColourList.OverviewChartBackground,
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(height: 10,),
//                                   Topic1(elevationvalue),
//                                   SizedBox(height: 10,),
//
//                                   ExpenseandIncomeTableSTL("Expense",ExpenseTable,elevationvalue,TileWidthAllAccounts),
//
//                                   SizedBox(height: 10,),
//
//                                   Gauges(elevationvalue),
//
//                                   SizedBox(height: 10,),
//
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                     children: [
//                                       AllTransectionsForTheTime.length==0 || !CheckTransectionAvailability("Expenses")?
//                                       Container(
//                                         height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//                                         width: MediaQuery.of(context).size.width*TileWidthIncomeAndExpenses,
//                                         decoration: BoxDecoration(
//                                             color: ColourList.OverviewChartBackground,
//                                             borderRadius: BorderRadius.all(Radius.circular(20))
//                                         ),):DoughnutChartForOverview(ExpensePiechartData,"Expense",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                       RadialBarChartForOverview(ExpenseRadialBarchartData,"Expense",MediaQuery.of(context).size.width*TileWidthAllAccounts,MediaQuery.of(context).size.width*TileHeightAllAccounts),
//                                     ],
//                                   ),
//                                   SizedBox(height: 10,),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10,),
//                           Material(
//                             elevation: elevationvalue,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(20),
//                             ),
//                             child: Container(
// // height: MediaQuery.of(context).size.width-20,
//                               width: MediaQuery.of(context).size.width*0.98,
//                               padding: EdgeInsets.symmetric(vertical: 10,),
// // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//                               decoration: BoxDecoration(
//                                   color: ColourList.OverviewChartBackground,
//                                   borderRadius: BorderRadius.all(Radius.circular(20))
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(height: 10,),
//                                   Topic3(elevationvalue),
//                                   SizedBox(height: 10,),
//                                   StackWeeklyBarChart(0.96,0.5,"Expenses"),
//                                   SizedBox(height: 10,),
//                                   // WeeklySplineBarChart(0.96,0.5,"Expenses"),
//                                   // SizedBox(height: 10,),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ))
//                   ),
//
//
//
//
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.14,),
//                 ],
//               ),
//             ),
//
//
//             Material(
//               elevation: elevationvalue*4,
//               color: Colors.white.withOpacity(0.8),
//               borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70),),
//               child: Container(
//                 height: MediaQuery.of(context).size.height * 0.22,
//                 width:MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70),),
//                   // boxShadow: [kBoxShadow],
//                 ),
//                 child: Column(
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).size.height*0.07,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         DropdownButton<String>(
//
//                           value: AccountValue,
//                           onChanged: (String? newValue) {
//                             FiltersForTheApp.IncomeOrExpense = newValue!;
//                             Navigator.of(context).pushReplacementNamed("overview_page");
//                           },
//                           items: IncomesOrExpenses
//                               .map<DropdownMenuItem<String>>((String Value_Selected) {
//                             return DropdownMenuItem<String>(
//
//                               onTap: () => {
//
//                               },
//
//                               value: Value_Selected,
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *0.35,
//                                     height: MediaQuery.of(context).size.width *0.09,
//                                     decoration: BoxDecoration(
//                                       // color: Colors.white54.withOpacity(1.0),
//                                       borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         width: MediaQuery.of(context).size.width *0.05,
//                                         height: MediaQuery.of(context).size.width *0.09,
//                                         child: Container(
//                                           child: Image.asset("assets/IncomePagePics/all_accounts.png"),
//                                           // color: Colors.black54.withOpacity(0.1),
//
//                                         ),
//                                       ),
//                                       SizedBox(width: 10,),
//                                       Container(
//                                         width: MediaQuery.of(context).size.height *0.13,
//                                         // height: MediaQuery.of(context).size.height *0.3,
//                                         child: Center(
//                                             child: Text(Value_Selected,style: TextStyle(color: Colors.black),)
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                           borderRadius: BorderRadius.circular(30),
//                           dropdownColor: Colors.white70,
//                         ),
//
//                         // SizedBox(width: 20,),
//
//                         DropdownButton<String>(
//                           // dropdownColor: Colors.white54.withOpacity(1.0),
//                           value: dropdownValue,
//                           onChanged: (String? newValue) {
//                             FiltersForTheApp.AccountType = newValue!;
//                             Navigator.of(context).pushReplacementNamed("overview_page");
//                           },
//                           items: Accounts
//                               .map<DropdownMenuItem<String>>((String Value_Selected) {
//                             return DropdownMenuItem<String>(
//
//                               onTap: () => {
//
//                               },
//
//                               value: Value_Selected,
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *0.35,
//                                     height: MediaQuery.of(context).size.width *0.09,
//                                     decoration: BoxDecoration(
//                                       // color: Colors.white54.withOpacity(1.0),
//                                       borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         width: MediaQuery.of(context).size.width *0.05,
//                                         height: MediaQuery.of(context).size.width *0.09,
//                                         child: Container(
//                                           child: Image.asset("assets/IncomePagePics/all_accounts.png"),
//                                           // color: Colors.black54.withOpacity(0.1),
//
//                                         ),
//                                       ),
//                                       SizedBox(width: 10,),
//                                       Container(
//                                         width: MediaQuery.of(context).size.height *0.13,
//                                         // height: MediaQuery.of(context).size.height *0.3,
//                                         child: Center(
//                                             child: Text(Value_Selected,style: TextStyle(color: Colors.black),)
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                           borderRadius: BorderRadius.circular(30),
//                           dropdownColor: Colors.white70,
//                         ),
//
//                       ],
//                     ),
//                     Text(
//                       "Overview",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w800,
//                         color: Colors.grey.withOpacity(0.9),
//                         fontSize: MediaQuery.of(context).size.width*0.09,
//                         fontFamily: "arlrdbd",
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 ),
//             ),
//             BottomNavBarV2(false),
//           ]
//       ),
//     );
//   }
// }
//
//
// List<DoughnutChartData> DoughnutChartDataReturn(List <Categories> ListOfAmounts)
// {
//   final List<DoughnutChartData> chartData = [];
//
//   double tempsum=0;
//   for(int i=0;i<ListOfAmounts.length;i++)
//   {
//     tempsum+=ListOfAmounts[i].CurrentSum;
//   }
//   for(int i=0;i<ListOfAmounts.length;i++)
//   {
//     chartData.add(DoughnutChartData(ListOfAmounts[i].CategoryName, (ListOfAmounts[i].CurrentSum).toDouble(), ((ListOfAmounts[i].CurrentSum).toDouble()/tempsum)*100 , ListOfAmounts[i].ButtonColor));
//   }
//   return chartData;
// }
//
//
// List<RadialBarChartData> RadialBarChartDataReturn(List <Categories> ListOfAmounts)
// {
//   final List<RadialBarChartData> chartData = [];
//
//   for(int i=0;i<ListOfAmounts.length;i++)
//   {
//     chartData.add(RadialBarChartData(ListOfAmounts[i].CategoryName, (ListOfAmounts[i].CurrentSum).toDouble(), ListOfAmounts[i].ButtonColor));
//   }
//   return chartData;
// }
//
//
//
//
//
// class Topic1 extends StatelessWidget {
//
//   double elevationvalue;
//   Topic1(this.elevationvalue);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue,
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//
//       child: Container(
//         width: MediaQuery.of(context).size.width*0.9,
//         height: MediaQuery.of(context).size.width * 0.25,
//         // padding: EdgeInsets.symmetric(vertical: 20,),
//         // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03,),
//         decoration: BoxDecoration(
//             color: Colors.blueGrey.withOpacity(0.1),
//             // image: DecorationImage(
//             //   fit: BoxFit.cover,
//             //
//             //   image: AssetImage("assets/Budget page/Backgrounds/1.jpg"),
//             // ),
//             borderRadius: BorderRadius.all(Radius.circular(20))
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Daily Overview",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.056,
//                       ),
//                     ),
//                     Text(
//                       "Date : ${DateFormat.MMMMEEEEd().format(FiltersForTheApp.StartingDate)}",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.036,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ExpenseandIncomeTableSTL extends StatelessWidget {
//
//   String IncomeOrExpense;
//   List <Categories> ExpenseTable;
//   double elevationvalue;
//   double TileWidthAllAccounts;
//   ExpenseandIncomeTableSTL(this.IncomeOrExpense,this.ExpenseTable,this.elevationvalue,this.TileWidthAllAccounts);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue-1,
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//       child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 13,vertical: 26),
//           // height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//           width: MediaQuery.of(context).size.width*TileWidthAllAccounts*2+10,
//           decoration: BoxDecoration(
//             // color: ColourList.OverviewChartBackground,
//               color: Colors.blueGrey.withOpacity(0.02),
//               borderRadius: BorderRadius.all(Radius.circular(20))
//           ),
//           child: Column(
//             children: [
//               Divider(
//                 thickness: 2,
//               ),
//               Text(IncomeOrExpense=='Expense'? 'Expense' : 'Income' ,style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.05,),),
//               SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   columnSpacing: MediaQuery.of(context).size.width*0.05,
//                   // dividerThickness: 2,
//                   dataRowHeight: MediaQuery.of(context).size.width*0.08,
//                   columns: [
//                     DataColumn(label: Flexible(child: Center(child: Text('Category',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
//                     DataColumn(label: Flexible(child:Center(child: Text(IncomeOrExpense=='Expense'? 'Today expense':'Today income',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
//                     DataColumn(label: Flexible(child:Center(child: Text(IncomeOrExpense=='Expense'? 'Total expense':'Total income',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
//                   ],
//                   rows: ExpenseTable // Loops through dataColumnText, each iteration assigning the value to element
//                       .map(
//                     ((element) => element.CategoryName=="Net Total"? DataRow(
//                       cells: <DataCell>[
//                         DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text(element.CategoryName.toString(),style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.width*0.033,),)))), //Extracting from Map element the value
//                         DataCell(Center(child: Text(element.TransectionAmount.toString(),style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.033,),))),
//                         DataCell(Center(child: Text(element.CurrentSum.toString(),style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.033,),))),
//                       ],
//                     ):DataRow(
//                       cells: <DataCell>[
//                         DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text(element.CategoryName.toString(),style: TextStyle(color: element.ButtonColor.withOpacity(0.7), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),)))), //Extracting from Map element the value
//                         DataCell(Center(child: Text(element.TransectionAmount.toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),))),
//                         DataCell(Center(child: Text(element.CurrentSum.toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),))),
//                       ],
//                     )),
//
//                   )
//                       .toList(),),
//               ),
//               Divider(
//                 thickness: 2,
//               ),
//             ],
//           )
//
//
//       ),
//     );
//   }
// }
//
// class Topic2 extends StatelessWidget {
//
//   double elevationvalue;
//   Topic2(this.elevationvalue);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue,
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//
//       child: Container(
//         width: MediaQuery.of(context).size.width*0.9,
//         height: MediaQuery.of(context).size.width * 0.25,
//         // padding: EdgeInsets.symmetric(vertical: 20,),
//         // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03,),
//         decoration: BoxDecoration(
//             color: Colors.blueGrey.withOpacity(0.1),
//             // image: DecorationImage(
//             //   fit: BoxFit.cover,
//             //
//             //   image: AssetImage("assets/Budget page/Backgrounds/1.jpg"),
//             // ),
//             borderRadius: BorderRadius.all(Radius.circular(20))
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Budget Overview",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.056,
//                       ),
//                     ),
//                     Text(
//                       "From ${DateFormat.MMMMEEEEd().format(DateTime.utc(2019, DateTime.now().month, 1))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.036,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Topic3 extends StatelessWidget {
//
//   double elevationvalue;
//   Topic3(this.elevationvalue);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue,
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//
//       child: Container(
//         width: MediaQuery.of(context).size.width*0.9,
//         height: MediaQuery.of(context).size.width * 0.25,
//         // padding: EdgeInsets.symmetric(vertical: 20,),
//         // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03,),
//         decoration: BoxDecoration(
//             color: Colors.blueGrey.withOpacity(0.1),
//             // image: DecorationImage(
//             //   fit: BoxFit.cover,
//             //
//             //   image: AssetImage("assets/Budget page/Backgrounds/1.jpg"),
//             // ),
//             borderRadius: BorderRadius.all(Radius.circular(20))
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       "Weekly Overview",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.056,
//                       ),
//                     ),
//                     Text(
//                       "From ${DateFormat.MMMMEEEEd().format(DateTime.now().add(Duration(days:FiltersForTheApp.StartDaysPastFromNow)))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
//                       style: TextStyle(
//                         color: ColourList.ChartTitleTextColor,
//                         fontFamily: 'Roboto',
//                         fontWeight: FontWeight.w800,
//                         fontSize: MediaQuery.of(context).size.width*0.036,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Gauges extends StatelessWidget {
//
//   double elevationvalue;
//   Gauges(this.elevationvalue);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue,
//       borderRadius: BorderRadius.all(
//         Radius.circular(20),
//       ),
//       child: Container(
//         // height: MediaQuery.of(context).size.width-20,
//         width: MediaQuery.of(context).size.width*0.98,
//         padding: EdgeInsets.symmetric(vertical: 10,),
//         // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.015,),
//         decoration: BoxDecoration(
//             color: ColourList.OverviewChartBackground,
//             borderRadius: BorderRadius.all(Radius.circular(20))
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 10,),
//
//             Topic2(elevationvalue),
//
//             Center(
//               child: Stack(
//                 children: [
//                   ConstrainedBox(
//                     constraints: BoxConstraints(
//                       maxHeight: MediaQuery.of(context).size.width*(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>9? 2.3: (ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>6? 1.74:(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>3? 1.2:0.65))),
//                     ),
//                     child: ListView(
//                       shrinkWrap: true,
//                       children: [
//                         Column(
//                           children: [
//                             // SizedBox(height: 10,),
//                             ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,0),
//                             SizedBox(height: 10,),
//                             ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,1),
//                             SizedBox(height: 10,),
//                             ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,2),
//                             SizedBox(height: 10,),
//                             ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,3),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     height: MediaQuery.of(context).size.width*(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>9? 2.1: (ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>6? 1.6:(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>3? 1.1:0.6))),
//                     width: MediaQuery.of(context).size.width,
//                     color: Colors.transparent,
//                   ),
//                 ],
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class NetTodayandMonth extends StatelessWidget {
//
//   List <Categories> ExpenseTable;
//   List <Categories> IncomeTable;
//   double elevationvalue;
//   double TileWidthAllAccounts;
//   NetTodayandMonth(this.IncomeTable,this.ExpenseTable,this.elevationvalue,this.TileWidthAllAccounts);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevationvalue-1,
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//       child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 13,vertical: 26),
//           // height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
//           width: MediaQuery.of(context).size.width*TileWidthAllAccounts*2+10,
//           decoration: BoxDecoration(
//             // color: ColourList.OverviewChartBackground,
//               color: Colors.blueGrey.withOpacity(0.02),
//               borderRadius: BorderRadius.all(Radius.circular(20))
//           ),
//           child: Column(
//             children: [
//               Divider(
//                 thickness: 2,
//               ),
//               Text('Net Balance' ,style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.04,),),
//
//               Divider(
//                 thickness: 2,
//               ),
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   columnSpacing: MediaQuery.of(context).size.width*0.09,
//                   // dividerThickness: 2,
//                   dataRowHeight: MediaQuery.of(context).size.width*0.10,
//                   columns: [
//                     DataColumn(label: Flexible(child: Center(child: Text('',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
//                     DataColumn(label: Flexible(child:Center(child: Text('Net Today',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
//                     DataColumn(label: Flexible(child:Center(child: Text('Net Total',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
//                   ],
//                   rows: [
//                     DataRow(
//                       cells: <DataCell>[
//                         DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text("Income",style: TextStyle(color: Colors.greenAccent.withOpacity(0.9), fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),)))), //Extracting from Map element the value
//                         DataCell(Center(child: Text((IncomeTable[IncomeTable.length-1].TransectionAmount-ExpenseTable[ExpenseTable.length-1].TransectionAmount).toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),))),
//                         DataCell(Center(child: Text((IncomeTable[IncomeTable.length-1].CurrentSum-ExpenseTable[ExpenseTable.length-1].CurrentSum).toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),))),
//                       ],
//                     )
//                   ],
//                     )
//
//                   ),
//               Divider(
//                 thickness: 2,
//               ),
//             ],
//           )
//
//
//       ),
//     );
//   }
// }
//
//
