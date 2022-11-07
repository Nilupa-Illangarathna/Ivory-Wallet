import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Classes/colors.dart';
import '../../DataFiles/StackedGraphDataFunction.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';


class StackWeeklyBarChart extends StatefulWidget {

  final double widthfactor;
  final double heightfactor;
  final String IncomeOrExpense;

  StackWeeklyBarChart(this.widthfactor,this.heightfactor,this.IncomeOrExpense);


  @override
  _StackWeeklyBarChartState createState() => _StackWeeklyBarChartState(widthfactor,heightfactor,IncomeOrExpense);
}

class _StackWeeklyBarChartState extends State<StackWeeklyBarChart> {
  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;

  final double widthfactor;
  final double heightfactor;
  final String IncomeOrExpense;
  _StackWeeklyBarChartState(this.widthfactor,this.heightfactor,this.IncomeOrExpense);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = Create_Stacked_Charts_DataList(DateTime.now().subtract(Duration(days:FiltersForTheApp.StartDaysPastFromNow)).add(Duration(days:1)),DateTime.now(),IncomeOrExpense,FiltersForTheApp.IncomeOrExpense);



    late ZoomPanBehavior _zoomPanBehavior;

    @override
    void initState(){
      _zoomPanBehavior = ZoomPanBehavior(enablePinching: true,enableDoubleTapZooming: true );
    }


    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
          width: MediaQuery.of(context).size.width * widthfactor,
          height: MediaQuery.of(context).size.height * heightfactor,
          decoration: BoxDecoration(
              color: ColourList.OverviewChartBackground,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: SfCartesianChart(
              title: ChartTitle(
                  text: IncomeOrExpense,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.center,
                  textStyle: TextStyle(
                    color: ColourList.ChartTitleTextColor,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  )
              ),

              enableAxisAnimation: true,
              zoomPanBehavior: ZoomPanBehavior(
                // Enables pinch zooming
                //   enablePanning: true,
                  enablePinching: true,
                  enableSelectionZooming: true,
                  zoomMode: ZoomMode.y
              ),
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                labelIntersectAction: AxisLabelIntersectAction.hide,
                labelRotation: 320,
                labelAlignment: LabelAlignment.start,
                maximumLabels: 10,
                labelStyle: TextStyle(
                  fontSize:
                  FiltersForTheApp.StartDaysPastFromNow>0 && FiltersForTheApp.StartDaysPastFromNow<=7? 10:
                  (FiltersForTheApp.StartDaysPastFromNow>7 && FiltersForTheApp.StartDaysPastFromNow<=15? 8:
                  (FiltersForTheApp.StartDaysPastFromNow>15 && FiltersForTheApp.StartDaysPastFromNow<=30? 6: 5 ))
                  ,),
              ),

              series: <ChartSeries>[

                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[0].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[0].color,

                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[1].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[1].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[2].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[2].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[3].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[3].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[4].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[4].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[5].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[5].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[6].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[6].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[7].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[7].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[8].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[8].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[9].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[9].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[10].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[10].color,
                ),
                StackedColumnSeries<ChartData, String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.Date,
                  yValueMapper: (ChartData data, _) => data.Sectors[11].size,
                  pointColorMapper: (ChartData data, _) => data.Sectors[11].color,
                ),
              ]
          )
      ),
    );
  }
}


