import '../../../../Classes/All Contralling Dart Files/BudgetsList.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import 'package:intl/intl.dart';
import '../../../../Classes/ChartData.dart';
import '../../../../Widgets/Three_gauge_in_a_row.dart';

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





class IncomeSummory extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final TileWidthAllAccounts;

  IncomeSummory(
      {Key? key, this.animationController, this.animation,this.TileWidthAllAccounts})
      : super(key: key);

  @override
  State<IncomeSummory> createState() => _IncomeSummoryState(TileWidthAllAccounts);
}

class _IncomeSummoryState extends State<IncomeSummory> {

  late List <Categories> ExpenseTable;
  late List <Categories> IncomeTable;

  double TileWidthAllAccounts;
  _IncomeSummoryState(this.TileWidthAllAccounts);

  @override
  void initState() {
    ExpenseTable = OverviewTableExpense();
    IncomeTable = OverviewTableIncome();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    // SetData();



    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child: ExpenseandIncomeTableSTL("Income",IncomeTable,FiltersForTheApp.elevationvalue,TileWidthAllAccounts)

          ),
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
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

class ExpenseandIncomeTableSTL extends StatelessWidget {

  String IncomeOrExpense;
  List <Categories> ExpenseTable;
  double elevationvalue;
  double TileWidthAllAccounts;
  ExpenseandIncomeTableSTL(this.IncomeOrExpense,this.ExpenseTable,this.elevationvalue,this.TileWidthAllAccounts);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13,vertical: 26),
          width: MediaQuery.of(context).size.width*TileWidthAllAccounts*2+10,
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Divider(
                thickness: 2,
              ),
              Text(IncomeOrExpense=='Expense'? 'Expense' : 'Income' ,style: TextStyle(color: Colors.blue.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: MediaQuery.of(context).size.width*0.05,),),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: MediaQuery.of(context).size.width*0.05,
                  dataRowHeight: MediaQuery.of(context).size.width*0.08,
                  columns: [
                    DataColumn(label: Flexible(child: Center(child: Text('Category',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
                    DataColumn(label: Flexible(child:Center(child: Text(IncomeOrExpense=='Expense'? 'Today expense':'Today income',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
                    DataColumn(label: Flexible(child:Center(child: Text(IncomeOrExpense=='Expense'? 'Total expense':'Total income',style: TextStyle(color: Colors.black.withOpacity(0.5), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.032,),)))),
                  ],
                  rows: ExpenseTable // Loops through dataColumnText, each iteration assigning the value to element
                      .map(
                    ((element) => element.CategoryName=="Net Total"? DataRow(
                      cells: <DataCell>[
                        DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text(element.CategoryName.toString(),style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.width*0.033,),)))), //Extracting from Map element the value
                        DataCell(Center(child: Text(element.TransectionAmount.toString(),style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.033,),))),
                        DataCell(Center(child: Text(element.CurrentSum.toString(),style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.033,),))),
                      ],
                    ):DataRow(
                      cells: <DataCell>[
                        DataCell(SingleChildScrollView(scrollDirection: Axis.horizontal,child: Center(child: Text(element.CategoryName.toString(),style: TextStyle(color: element.ButtonColor.withOpacity(0.7), fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),)))), //Extracting from Map element the value
                        DataCell(Center(child: Text(element.TransectionAmount.toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),))),
                        DataCell(Center(child: Text(element.CurrentSum.toString(),style: TextStyle(color: ColourList.ChartTitleTextColor, fontFamily: 'Roboto', fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.032,),))),
                      ],
                    )),

                  )
                      .toList(),),
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
          width: MediaQuery.of(context).size.width*TileWidthAllAccounts*2+10,
          decoration: BoxDecoration(
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


