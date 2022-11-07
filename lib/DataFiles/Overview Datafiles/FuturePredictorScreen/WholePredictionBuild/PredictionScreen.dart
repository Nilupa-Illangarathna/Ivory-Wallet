import 'package:intl/intl.dart';
import '../../FuturePredictorScreen/NetPredictionsWidget/IncomeSummory.dart';
import '../NetPredictionsWidget/NetTotalOverview.dart';
import '../UniqueTitle/UniqeTitle.dart';
import '../SettingsForFuturePrediction/fitness_app_theme.dart';
import '../VerticleListViewForEachCategoryPrediction/PieCharts.dart';
import 'package:flutter/material.dart';
import '../../../../Classes/colors.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import '../../../../Classes/AccountsClass.dart';
import '../../../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../../../Classes/ChartData.dart';
import '../../../../Classes/All Contralling Dart Files/BudgetsList.dart';
import '../../../../Widgets/Three_gauge_in_a_row.dart';
import '../VerticleListViewForEachCategoryPrediction/GaugesList.dart';
import '../VerticleListViewForEachCategoryPrediction/StackedBarCharts.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;




  var ColourList =ColorsClass();

  String dropdownValue = FiltersForTheApp.AccountType;
  String AccountValue = FiltersForTheApp.IncomeOrExpense;

  double elevationvalue=FiltersForTheApp.elevationvalue;

  final TileHeightAllAccounts=0.600;
  final TileWidthAllAccounts =0.440;
  final TileHeightIncomeAndExpenses=0.470;
  final TileWidthIncomeAndExpenses =0.470;

  final TileHeightStackedWeeklyBarChart = 0.90;
  final TileWidthStackedWeeklyBarChart = 0.90;

  final List<DoughnutChartData> IncomePiechartData = DoughnutChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
  final List<DoughnutChartData> ExpensePiechartData = DoughnutChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));
  final List<RadialBarChartData> IncomeRadialBarchartData = RadialBarChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
  final List<RadialBarChartData> ExpenseRadialBarchartData = RadialBarChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));


  late List <Categories> ExpenseTable;
  late List <Categories> IncomeTable;




  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();

    ExpenseTable = OverviewTableExpense();
    IncomeTable = OverviewTableIncome();


  }

  void addAllListData() async{
    const int count = 9;
    listViews.add(
      SizedBox(
        height: 80,
      ),
    );

//Daily Overview
    listViews.add(
      await TitleView(
        titleTxt: 'Daily Overview',
        subTxt:  "Date : ${DateFormat.MMMMEEEEd().format(FiltersForTheApp.StartingDate)}",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    AccountValue == "All Types"? listViews.add(
      await NetTotalOverview(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
            Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    ):SizedBox(width: 0,height: 0,);


    AccountValue == "All Types"|| AccountValue == "Incomes"? listViews.add(
      await PieChartSet(
          mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 3, 1.0,
                      curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: widget.animationController,
          IncomeOrExpense: AccountValue == "All Types"? "Both":"Incomes",
          TileHeightAllAccounts:TileHeightAllAccounts,
          TileWidthAllAccounts:TileWidthAllAccounts
      ),
    ):listViews.add(PieChartSet(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
        IncomeOrExpense: "Expenses",
        TileHeightAllAccounts:TileHeightAllAccounts,
        TileWidthAllAccounts:TileWidthAllAccounts
    ));

    AccountValue == "All Types"|| AccountValue == "Incomes"? listViews.add(
      ExpenseandIncomeTableSTL("Income",IncomeTable,elevationvalue,TileWidthAllAccounts),
    ):SizedBox(width: 0,height: 0,);
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
      ExpenseandIncomeTableSTL("Expense",ExpenseTable,elevationvalue,TileWidthAllAccounts),
    ):SizedBox(width: 0,height: 0,);


//Budget Overview
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
      await SizedBox(height:20)
    ):Container(height: 0,width: 0,);
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
      await Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Budget Overview',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: FitnessAppTheme.fontName,
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: 0.5,
              color: FitnessAppTheme.lightText,
            ),
          ),
        ),
      ),
    ):Container(height: 0,width: 0,);
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
        await SizedBox(height:10)
    ):Container(height: 0,width: 0,);
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
      await Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "From ${DateFormat.MMMMEEEEd().format(DateTime.utc(2019, DateTime.now().month, 1))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.nearlyDarkBlue,
                ),
              ),
            ),

          ],
        ),
      ),
    ):Container(height: 0,width: 0,);
    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
        await SizedBox(height:20)
    ):Container(height: 0,width: 0,);



    AccountValue == "All Types"|| AccountValue == "Expenses"? listViews.add(
      await GaugesList(
          mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 3, 1.0,
                      curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: widget.animationController,
          IncomeOrExpense: "All Types",
          Width: MediaQuery.of(context).size.width*0.7,
          Height: MediaQuery.of(context).size.width*0.7,
          CategoriesList: ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),
          BudgetsList: BudgetValues,
          SetOfIndexes: 0,
      ),
    ):SizedBox(height: 0,width: 0,);

/////////
//Weekly Overview
    listViews.add(
        await SizedBox(height:20)
    );
    listViews.add(
      await Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Weekly Overview',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: FitnessAppTheme.fontName,
              fontWeight: FontWeight.w500,
              fontSize: 24,
              letterSpacing: 0.5,
              color: FitnessAppTheme.lightText,
            ),
          ),
        ),
      ),
    );
    listViews.add(
        await SizedBox(height:10)
    );
    listViews.add(
      await Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "From ${DateFormat.MMMMEEEEd().format(DateTime.now().add(Duration(days:FiltersForTheApp.StartDaysPastFromNow)))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: FitnessAppTheme.fontName,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  letterSpacing: 0.5,
                  color: FitnessAppTheme.nearlyDarkBlue,
                ),
              ),
            ),

          ],
        ),
      ),
    );
    listViews.add(
        await SizedBox(height:20)
    );

    AccountValue == "All Types"|| AccountValue == "Incomes"? listViews.add(
      await StackedBarChartsSet(
          mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 3, 1.0,
                      curve: Curves.fastOutSlowIn))),
          mainScreenAnimationController: widget.animationController,
          IncomeOrExpense: AccountValue == "All Types"? "Both":"Incomes",
          TileHeightAllAccounts:TileHeightAllAccounts,
          TileWidthAllAccounts:TileWidthAllAccounts
      ),
    ):listViews.add(StackedBarChartsSet(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 3, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
        IncomeOrExpense: "Expenses",
        TileHeightAllAccounts:TileHeightAllAccounts,
        TileWidthAllAccounts:TileWidthAllAccounts
    ));

    listViews.add(
        await SizedBox(height:30)
    );

  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 19 - 8.0 * topBarOpacity),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'OvewView',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30 + 6 - 6 * topBarOpacity,
                                        letterSpacing: 1.2,
                                        color: FitnessAppTheme.darkerText,
                                      ),
                                    ),
                                  ),
                                ),




                              ],
                            ),



                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownButton<String>(

                                  value: AccountValue,
                                  onChanged: (String? newValue) {
                                    FiltersForTheApp.IncomeOrExpense = newValue!;
                                    Navigator.of(context).pushReplacementNamed("overview_page");
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
                                            width: MediaQuery.of(context).size.width *0.35,
                                            height: MediaQuery.of(context).size.width *0.09,
                                            decoration: BoxDecoration(
                                              // color: Colors.white54.withOpacity(1.0),
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


                                DropdownButton<String>(
                                  value: dropdownValue,
                                  onChanged: (String? newValue) {
                                    FiltersForTheApp.AccountType = newValue!;
                                    Navigator.of(context).pushReplacementNamed("overview_page");
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
                                            width: MediaQuery.of(context).size.width *0.35,
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

                              ],
                            ),

                            SizedBox(height: 10,),


                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
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


List<RadialBarChartData> RadialBarChartDataReturn(List <Categories> ListOfAmounts)
{
  final List<RadialBarChartData> chartData = [];

  for(int i=0;i<ListOfAmounts.length;i++)
  {
    chartData.add(RadialBarChartData(ListOfAmounts[i].CategoryName, (ListOfAmounts[i].CurrentSum).toDouble(), ListOfAmounts[i].ButtonColor));
  }
  return chartData;
}





class Topic1 extends StatelessWidget {

  double elevationvalue;
  Topic1(this.elevationvalue);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(Radius.circular(20)),

      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.width * 0.25,decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Daily Overview",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.056,
                      ),
                    ),
                    Text(
                      "Date : ${DateFormat.MMMMEEEEd().format(FiltersForTheApp.StartingDate)}",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.036,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Topic2 extends StatelessWidget {

  double elevationvalue;
  Topic2(this.elevationvalue);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(Radius.circular(20)),

      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Budget Overview",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.056,
                      ),
                    ),
                    Text(
                      "From ${DateFormat.MMMMEEEEd().format(DateTime.utc(2019, DateTime.now().month, 1))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.036,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Topic3 extends StatelessWidget {

  double elevationvalue;
  Topic3(this.elevationvalue);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(Radius.circular(20)),

      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Weekly Overview",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.056,
                      ),
                    ),
                    Text(
                      "From ${DateFormat.MMMMEEEEd().format(DateTime.now().add(Duration(days:FiltersForTheApp.StartDaysPastFromNow)))} To ${DateFormat.MMMMEEEEd().format(DateTime.now())}",
                      style: TextStyle(
                        color: ColourList.ChartTitleTextColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        fontSize: MediaQuery.of(context).size.width*0.036,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Gauges extends StatelessWidget {

  double elevationvalue;
  Gauges(this.elevationvalue);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width*0.98,
        padding: EdgeInsets.symmetric(vertical: 10,),
        decoration: BoxDecoration(
            color: ColourList.OverviewChartBackground,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),

            Topic2(elevationvalue),

            Center(
              child: Stack(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.width*(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>9? 2.3: (ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>6? 1.74:(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>3? 1.2:0.65))),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: [
                            ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,0),
                            SizedBox(height: 10,),
                            ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,1),
                            SizedBox(height: 10,),
                            ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,2),
                            SizedBox(height: 10,),
                            ThreeGaugesInARow(MediaQuery.of(context).size.width*0.30,MediaQuery.of(context).size.width*0.51,ExpenseFilteredCategoryValuesForGauges(Currently_Using_Expense_Categories),BudgetValues,3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width*(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>9? 2.1: (ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>6? 1.6:(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories).length>3? 1.1:0.6))),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}


class NetTodayandMonth extends StatelessWidget {

  List <Categories> ExpenseTable;
  List <Categories> IncomeTable;
  double elevationvalue;
  double TileWidthAllAccounts;
  NetTodayandMonth(this.IncomeTable,this.ExpenseTable,this.elevationvalue,this.TileWidthAllAccounts);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevationvalue-1,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13,vertical: 26),
          // height: MediaQuery.of(context).size.width*TileHeightAllAccounts,
          width: MediaQuery.of(context).size.width*TileWidthAllAccounts*2+10,
          decoration: BoxDecoration(
            // color: ColourList.OverviewChartBackground,
              color: Colors.blueGrey.withOpacity(0.02),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Text('Net Balance' ,style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.04,),),

              Divider(
                thickness: 2,
              ),

              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: MediaQuery.of(context).size.width*0.09,
                    // dividerThickness: 2,
                    dataRowHeight: MediaQuery.of(context).size.width*0.10,
                    columns: [
                      DataColumn(label: Flexible(child: Center(child: Text('',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
                      DataColumn(label: Flexible(child:Center(child: Text('Net Today',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
                      DataColumn(label: Flexible(child:Center(child: Text('Net Total',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.036,),)))),
                    ],
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text("Income",style: TextStyle(color: Colors.greenAccent.withOpacity(0.9), fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),)))), //Extracting from Map element the value
                          DataCell(Center(child: Text((IncomeTable[IncomeTable.length-1].TransectionAmount-ExpenseTable[ExpenseTable.length-1].TransectionAmount).toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),))),
                          DataCell(Center(child: Text((IncomeTable[IncomeTable.length-1].CurrentSum-ExpenseTable[ExpenseTable.length-1].CurrentSum).toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.039,),))),
                        ],
                      )
                    ],
                  )

              ),
              Divider(
                thickness: 2,
              ),
            ],
          )


      ),
    );
  }
}


