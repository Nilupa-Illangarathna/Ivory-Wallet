import 'package:flutter/material.dart';
import '../../Classes/AccountsClass.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Classes/ChartData.dart';
import '../../Classes/colors.dart';

class RadialBarChartForOverview extends StatefulWidget {
  // const DoughnutChartForOverview({Key? key}) : super(key: key);

  final List<RadialBarChartData> chartData;
  final String IsIncomeOrExpense;
  final WidthOfTheTile;
  final HeightOfTheTile;
  RadialBarChartForOverview(this.chartData,this.IsIncomeOrExpense,this.WidthOfTheTile,this.HeightOfTheTile);

  @override
  _RadialBarChartForOverviewState createState() => _RadialBarChartForOverviewState(chartData,IsIncomeOrExpense,WidthOfTheTile,HeightOfTheTile);
}

class _RadialBarChartForOverviewState extends State<RadialBarChartForOverview> {

  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;

  final List<RadialBarChartData> chartData;
  final String IsIncomeOrExpense;
  final WidthOfTheTile;
  final HeightOfTheTile;
  _RadialBarChartForOverviewState(this.chartData,this.IsIncomeOrExpense,this.WidthOfTheTile,this.HeightOfTheTile);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: elevationvalue,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            height: HeightOfTheTile,
            width: WidthOfTheTile,
            // color: ColourList.OverviewChartBackground,
            decoration: BoxDecoration(
                color: ColourList.OverviewChartBackground,
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: SfCircularChart(
                // title: ChartTitle(
                //     text: IsIncomeOrExpense,
                //     // Aligns the chart title to left
                //     alignment: ChartAlignment.center,
                //     textStyle: TextStyle(
                //       color: ColourList.ChartTitleTextColor,
                //       fontFamily: 'Roboto',
                //       fontSize: 14,
                //     )
                // ),
                // legend: Legend(
                //     itemPadding: 4,
                //     textStyle: TextStyle(
                //       fontSize: 10,
                //       color: ColourList.ChartLegendTextColor,
                //     ),
                //     isVisible: true,
                //     overflowMode: LegendItemOverflowMode.wrap,
                //     position: LegendPosition.top
                // ),
                // borderColor: Colors.grey.withOpacity(0.1),
                // borderWidth: 2,
                series: <CircularSeries>[
                  RadialBarSeries<RadialBarChartData, String>(
                    trackColor: Colors.black87.withOpacity(0.002),
                    dataSource: chartData,
                    xValueMapper: (RadialBarChartData data, _) => data.x,
                    yValueMapper: (RadialBarChartData data, _) => data.y,
                    pointColorMapper: (RadialBarChartData data, _) => data.color,
                    dataLabelSettings: DataLabelSettings(
                      // Renders the data label
                      textStyle: TextStyle(
                        fontSize: 7,
                        color: Colors.grey,
                      ),
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                    ),
                    // Radius of the radial bar
                    // All the segments will be exploded
                    innerRadius: '30%',
                    radius: '90%',
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}
