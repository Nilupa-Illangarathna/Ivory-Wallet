import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import '../VerticleListViewForEachCategoryPrediction/meals_list_data.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';

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





class NetTotalOverview extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  NetTotalOverview(
      {Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<NetTotalOverview> createState() => _NetTotalOverviewState();
}

class _NetTotalOverviewState extends State<NetTotalOverview> {
  List<MealsListData> IncomemealsListData = [];

  List<MealsListData> ExpensemealsListData = [];

  List <Categories> horizontal_Tile_View_DataList = [];

  late List <Categories> ExpenseTable;
  late List <Categories> IncomeTable;
  double elevationvalue=FiltersForTheApp.elevationvalue;
  final TileWidthAllAccounts =0.440;


  @override
  void initState() {
    ExpenseTable = OverviewTableExpense();
    IncomeTable = OverviewTableIncome();
  }

  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    ExpenseTable = OverviewTableExpense();
    IncomeTable = OverviewTableIncome();

        for(int i=0;i<IncomeTable.length;i++){
      print(IncomeTable[i].TransectionAmount);
    }

    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
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
                    Text('Net Balance' ,style: TextStyle(color: Colors.blue.withOpacity(0.8), fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.width*0.04,),),

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
