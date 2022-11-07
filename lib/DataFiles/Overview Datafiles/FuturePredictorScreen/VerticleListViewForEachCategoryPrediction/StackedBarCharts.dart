import '../../FuturePredictorScreen/WholePredictionBuild/PredictionScreen.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import 'meals_list_data.dart';
import 'package:flutter/material.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/TransectionsClass.dart';
import '../../../../Classes/ChartData.dart';
import '../../../../Widgets/Charts/stackedWeeklyBarChart.dart';


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}






class StackedBarChartsSet extends StatefulWidget {
  const StackedBarChartsSet(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation,required this.IncomeOrExpense,required this.TileWidthAllAccounts,required this.TileHeightAllAccounts})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final String IncomeOrExpense;
  final TileWidthAllAccounts;
  final TileHeightAllAccounts;

  @override
  _StackedBarChartsSetState createState() => _StackedBarChartsSetState(IncomeOrExpense,TileWidthAllAccounts,TileHeightAllAccounts);
}

class _StackedBarChartsSetState extends State<StackedBarChartsSet> with TickerProviderStateMixin {
  AnimationController? animationController;

  final List<DoughnutChartData> IncomePiechartData = DoughnutChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
  final List<DoughnutChartData> ExpensePiechartData = DoughnutChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));
  final List<RadialBarChartData> IncomeRadialBarchartData = RadialBarChartDataReturn(IncomeFilteredCategoryValues(Currently_Using_Income_Categories));
  final List<RadialBarChartData> ExpenseRadialBarchartData = RadialBarChartDataReturn(ExpenseFilteredCategoryValues(Currently_Using_Expense_Categories));

  String IncomeOrExpense;
  double TileWidthAllAccounts;
  double TileHeightAllAccounts;
  _StackedBarChartsSetState(this.IncomeOrExpense,this.TileWidthAllAccounts,this.TileHeightAllAccounts);


  List<MealsListData> mealsListData = [];

  List <Categories> horizontal_Tile_View_DataList = [];

  late List <String> ChartSet;
  late List <List<DoughnutChartData>> ChartData;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    // IncomeOrExpense=="Both"? 2:1

    IncomeOrExpense=="Both"? ChartSet=["Incomes","Expenses"]: (IncomeOrExpense=="Incomes"? ChartSet=["Incomes"]:ChartSet=["Expenses"] );
    IncomeOrExpense=="Both"? ChartData=[IncomePiechartData,ExpensePiechartData]: (IncomeOrExpense=="Incomes"? ChartData=[IncomePiechartData]:ChartData=[ExpensePiechartData] );

    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: MediaQuery.of(context).size.width*TileHeightAllAccounts*1.5,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 16, left: 16),
                  itemCount: IncomeOrExpense=="Both"? 2:1,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final int count =
                        10;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn)));
                    animationController?.forward();

                    return AnimatedBuilder(
                      animation: animationController!,
                      builder: (BuildContext context, Widget? child) {
                        return FadeTransition(
                          opacity: animation!,
                          child: Transform(
                              transform: Matrix4.translationValues(
                                  100 * (1.0 - animation!.value), 0.0, 0.0),
                              child: AllTransectionsForTheTime.length==0 || !CheckTransectionAvailability(ChartSet[index])?
                              Material(
                                elevation: FiltersForTheApp.elevationvalue,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  height: 0,
                                  width: 0,
                                  decoration: BoxDecoration(
                                      color: ColourList.OverviewChartBackground,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),),
                              )
                              : Padding(
                                padding:  EdgeInsets.only(right: ChartSet[index]==ChartSet[0] && IncomeOrExpense=="Both"? 20:0,bottom: 5),
                                child: StackWeeklyBarChart(1.3,0.5,ChartSet[index]),
                              ),

                          ),
                        );
                      },
                    );

                      // MealsView(
                      // mealsListData: mealsListData[index],
                      // animation: animation,
                      // animationController: animationController!,
                      // IncomeOrExpense: IncomeOrExpense,
                    // );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

