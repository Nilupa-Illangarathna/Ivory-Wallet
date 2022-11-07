import 'package:animated_widgets/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../Classes/colors.dart';
import '../../Classes/All Contralling Dart Files/TransectionsClass.dart';
import 'package:intl/intl.dart';
import '../../Classes/All Contralling Dart Files/category_types.dart';
import '../../DataFiles/StackedGraphDataFunction.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../DataFiles/Predictor Screen Data Files/DataGenerators/PredictionDataFIles.dart';


class PredictorBubbleChart extends StatefulWidget {
  // const StackWeeklyBarChart({Key? key}) : super(key: key);/**/

  final double widthfactor;
  final double heightfactor;
  final String IncomeOrExpense;
  PredictorBubbleChart(this.widthfactor,this.heightfactor,this.IncomeOrExpense);


  @override
  _PredictorBubbleChartState createState() => _PredictorBubbleChartState(widthfactor,heightfactor,IncomeOrExpense);
}

class _PredictorBubbleChartState extends State<PredictorBubbleChart> {
  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;

  final double widthfactor;
  final double heightfactor;
  final String IncomeOrExpense;
  _PredictorBubbleChartState(this.widthfactor,this.heightfactor,this.IncomeOrExpense);

  @override
  Widget build(BuildContext context) {

    List<BubbleChartData> chartData = Create_Bubble_Charts_DataList(DateTime.now().subtract(Duration(days:FiltersForTheApp.StartDaysPastFromNow)).add(Duration(days:1)),DateTime.now(),IncomeOrExpense,FiltersForTheApp.IncomeOrExpense);


    late ZoomPanBehavior _zoomPanBehavior;

    @override
    void initState(){
      _zoomPanBehavior = ZoomPanBehavior(enablePinching: false,enableDoubleTapZooming: false );
    }

    List <Categories> CategoryObtainList= IncomeOrExpense=="Incomes"? Currently_Using_Income_Categories:Currently_Using_Expense_Categories;


    return Material(
      elevation: elevationvalue,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
          width: MediaQuery.of(context).size.width * widthfactor*1,
          height: MediaQuery.of(context).size.width * heightfactor*2.3,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child:Text(""),
                // child: SizedBox(
                //   height: 0,
                // ),
              ),
              Expanded(
                flex: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child:Text(""),
                      // child: SizedBox(
                      //   height: 0,
                      // ),
                    ),
                    Expanded(
                      flex: 100,
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

                          legend: Legend(
                              itemPadding: 4,
                              textStyle: TextStyle(
                                fontSize: 10,
                                color: ColourList.ChartLegendTextColor,
                              ),
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap,
                              position: LegendPosition.right,
                              iconBorderColor: Colors.red,

                          ),

                          // borderWidth: 0,
                          // plotAreaBorderWidth: 10,
                          series: <ChartSeries>[
                            // Renders scatter chart
                            BubbleSeries<BubbleChartData, String>(

                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[0].size!=0? "${data.Sectors[0].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>0? CategoryObtainList[0].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),

                              name:  CategoryObtainList.length>0? CategoryObtainList[0].CategoryName:"",
                              color: CategoryObtainList.length>0? CategoryObtainList[0].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[0].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[0].BoldOrNot? data.Sectors[0].color.withOpacity(0.8):data.Sectors[0].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[0].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[1].size!=0? "${data.Sectors[1].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>1? CategoryObtainList[1].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>1? CategoryObtainList[1].CategoryName:"",
                              color: CategoryObtainList.length>1? CategoryObtainList[1].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[1].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[1].BoldOrNot? data.Sectors[1].color.withOpacity(0.8):data.Sectors[1].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[1].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[2].size!=0? "${data.Sectors[2].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>2? CategoryObtainList[2].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>2? CategoryObtainList[2].CategoryName:"",
                              color: CategoryObtainList.length>2? CategoryObtainList[2].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[2].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[2].BoldOrNot? data.Sectors[2].color.withOpacity(0.8):data.Sectors[2].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[2].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[3].size!=0? "${data.Sectors[3].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>3? CategoryObtainList[3].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>3? CategoryObtainList[3].CategoryName:"",
                              color: CategoryObtainList.length>3? CategoryObtainList[3].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[3].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[3].BoldOrNot? data.Sectors[3].color.withOpacity(0.8):data.Sectors[3].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[3].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[4].size!=0? "${data.Sectors[4].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>4? CategoryObtainList[4].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>4? CategoryObtainList[4].CategoryName:"",
                              color: CategoryObtainList.length>4? CategoryObtainList[4].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[4].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[4].BoldOrNot? data.Sectors[4].color.withOpacity(0.8):data.Sectors[4].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[4].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[5].size!=0? "${data.Sectors[5].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>5? CategoryObtainList[5].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>5? CategoryObtainList[5].CategoryName:"",
                              color: CategoryObtainList.length>5? CategoryObtainList[5].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[5].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[5].BoldOrNot? data.Sectors[5].color.withOpacity(0.8):data.Sectors[5].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[5].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[6].size!=0? "${data.Sectors[6].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>6? CategoryObtainList[6].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>6? CategoryObtainList[6].CategoryName:"",
                              color: CategoryObtainList.length>6? CategoryObtainList[6].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[6].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[6].BoldOrNot? data.Sectors[6].color.withOpacity(0.8):data.Sectors[6].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[6].size.toDouble(),
                            ),




                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[7].size!=0? "${data.Sectors[7].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>7? CategoryObtainList[7].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>7? CategoryObtainList[7].CategoryName:"",
                              color: CategoryObtainList.length>7? CategoryObtainList[7].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[7].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[7].BoldOrNot? data.Sectors[7].color.withOpacity(0.8):data.Sectors[7].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[7].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[8].size!=0? "${data.Sectors[8].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>8? CategoryObtainList[8].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>8? CategoryObtainList[8].CategoryName:"",
                              color: CategoryObtainList.length>8? CategoryObtainList[8].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[8].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[8].BoldOrNot? data.Sectors[8].color.withOpacity(0.8):data.Sectors[8].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[8].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[9].size!=0? "${data.Sectors[9].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>9? CategoryObtainList[9].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>9? CategoryObtainList[9].CategoryName:"",
                              color: CategoryObtainList.length>9? CategoryObtainList[9].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[9].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[9].BoldOrNot? data.Sectors[9].color.withOpacity(0.8):data.Sectors[9].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[9].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[10].size!=0? "${data.Sectors[10].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>10? CategoryObtainList[10].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>10? CategoryObtainList[10].CategoryName:"",
                              color: CategoryObtainList.length>10? CategoryObtainList[10].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[10].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[10].BoldOrNot? data.Sectors[10].color.withOpacity(0.8):data.Sectors[10].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[10].size.toDouble(),
                            ),
                            BubbleSeries<BubbleChartData, String>(
                              dataLabelMapper: (BubbleChartData data,  _) => data.Sectors[11].size!=0? "${data.Sectors[11].size}":"",
                              dataLabelSettings: DataLabelSettings(
                                // Renders the data label
                                textStyle: TextStyle(
                                  fontSize: 5.5,
                                  color: CategoryObtainList.length>11? CategoryObtainList[11].ButtonColor.withOpacity(0.4):Colors.white.withOpacity(0),
                                ),
                                isVisible: true,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              name:  CategoryObtainList.length>11? CategoryObtainList[11].CategoryName:"",
                              color: CategoryObtainList.length>11? CategoryObtainList[11].ButtonColor:Colors.white,
                              // maximumRadius: 5,
                              dataSource: chartData,
                              xValueMapper: (BubbleChartData data, _) => data.Date,
                              yValueMapper: (BubbleChartData data, _) => data.Sectors[11].size,
                              pointColorMapper: (BubbleChartData data, _) => data.Sectors[11].BoldOrNot? data.Sectors[11].color.withOpacity(0.8):data.Sectors[11].color.withOpacity(0.3),
                              sizeValueMapper: (BubbleChartData data, _) => data.Sectors[11].size.toDouble(),
                            ),


                          ]
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child:SizedBox(
                        width: 10,
                      ),
                      // child: SizedBox(
                      //   height: 0,
                      // ),
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child:Text(""),
                // child: SizedBox(
                //   height: 0,
                // ),
              ),
            ],
          )
      ),
    );
  }
}


