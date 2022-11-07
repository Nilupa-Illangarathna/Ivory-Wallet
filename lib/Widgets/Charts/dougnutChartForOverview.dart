import 'package:flutter/material.dart';
import '../../Classes/AccountsClass.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Classes/ChartData.dart';
import '../../Classes/colors.dart';



class DoughnutChartForOverview extends StatefulWidget {
  // const DoughnutChartForOverview({Key? key}) : super(key: key);

  final List<DoughnutChartData> chartData;
  final String IsIncomeOrExpense;
  final WidthOfTheTile;
  final HeightOfTheTile;
  DoughnutChartForOverview(this.chartData,this.IsIncomeOrExpense,this.WidthOfTheTile,this.HeightOfTheTile);

  @override
  _DoughnutChartForOverviewState createState() => _DoughnutChartForOverviewState(chartData,IsIncomeOrExpense,WidthOfTheTile,HeightOfTheTile);
}

class _DoughnutChartForOverviewState extends State<DoughnutChartForOverview> {

  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;

  final List<DoughnutChartData> chartData;
  final String IsIncomeOrExpense;
  final WidthOfTheTile;
  final HeightOfTheTile;
  _DoughnutChartForOverviewState(this.chartData,this.IsIncomeOrExpense,this.WidthOfTheTile,this.HeightOfTheTile);

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

            decoration: BoxDecoration(
                color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            // color: Colors.green,
            child: SfCircularChart(
                title: ChartTitle(
                    text: IsIncomeOrExpense,
                    // Aligns the chart title to left
                    alignment: ChartAlignment.center,
                    textStyle: TextStyle(
                      color: ColourList.ChartTitleTextColor,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                ),
                // borderColor: Colors.grey.withOpacity(0.1),
                // borderWidth: 2,
                // Sets 15 logical pixels as margin for all the 4 sides.
                margin: EdgeInsets.all(0),
                legend: Legend(
                    itemPadding: 4,
                    textStyle: TextStyle(
                      color: ColourList.ChartLegendTextColor,
                      fontSize: 10,
                    ),
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.scroll,
                    position: LegendPosition.top
                ),
                series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<DoughnutChartData, String>(
                      radius: "90%",
                      innerRadius: "0%",
                      dataSource: chartData,
                      dataLabelMapper: (DoughnutChartData data,  _) => "${(data.Lables).round().toString()}%",
                      dataLabelSettings: DataLabelSettings(
                        // Renders the data label
                        textStyle: TextStyle(
                          fontSize: 7,
                          color: ColourList.ChartPointerTextColor,
                        ),
                        isVisible: true,
                        labelPosition: ChartDataLabelPosition.outside,
                      ),

                      pointColorMapper:(DoughnutChartData data,  _) => data.color,
                      xValueMapper: (DoughnutChartData data, _) => data.x,
                      yValueMapper: (DoughnutChartData data, _) => data.y
                  )
                ]
            ),
          ),
        ),
      ],
    );
  }
}
