import 'package:flutter/material.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/category_types.dart';
import '../../DataFiles/Gauge datafiles/flutter_gauge.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../Classes/colors.dart';
import '../../DataFiles/Budget related/constants.dart';

class GaugeTile extends StatefulWidget {
  // const GaugeTile({Key? key}) : super(key: key);

  final Width;
  final Height;
  Categories Catrgory;
  Categories Budgets;

  GaugeTile(this.Width,this.Height,this.Catrgory,this.Budgets);


  @override
  _GaugeTileState createState() => _GaugeTileState(Width,Height,Catrgory,Budgets);
}

class _GaugeTileState extends State<GaugeTile> {

  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue-1;

  final Width;
  final Height;
  double CurrentValue=0;
  double BudgetValue=0;
  Categories Catrgory;
  Categories Budgets;

  _GaugeTileState(this.Width,this.Height,this.Catrgory,this.Budgets);


  double IndexValue(double CurrentValue,double BudgetValue){
    if(BudgetValue==0.0){
      return 0.0;
    }
    else if(BudgetValue<=CurrentValue){
      return 400.0;
    }
    else{
      return (CurrentValue.toDouble() * 400 / BudgetValue.toDouble()).toInt().toDouble();
    }
  }



  @override
  Widget build(BuildContext context) {

    CurrentValue = Catrgory.TransectionAmount;
    BudgetValue = Budgets.TransectionAmount;

    return Column(
      children: [


        Material(
          elevation: elevationvalue*0.5,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
            child: Container(
              height: Height*1.1,
              width: Width*0.9,
              decoration: BoxDecoration(
                color: ColourList.OverviewChartBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [BoxShadow(
              color: Budgets.ButtonColor.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(4, 4),
            )],

              ),
            child: Stack(
              children: [
                Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 1,),
                    SizedBox(height: 1,),
                    Text(
                        Catrgory.CategoryName,
                        style: TextStyle(
                          color: Budgets.ButtonColor.withOpacity(0.8),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          fontSize: 26,
                        )
                    ),
                    FlutterGauge(
                      inactiveColor: Budgets.ButtonColor.withOpacity(0.40),
                      // inactiveColor: Colors.grey.withOpacity(0.4),
                      activeColor: IndexValue(CurrentValue,BudgetValue)<130? Colors.greenAccent : (IndexValue(CurrentValue,BudgetValue)<260? Colors.orangeAccent : Colors.redAccent),
                      // activeColor:Colors.grey.withOpacity(0.4),
                      handSize: 30,
                      width: 2.2,   ///////Can be used to scale up down whole gauge
                      index: IndexValue(CurrentValue,BudgetValue),
                      fontFamily: "Iran",
                      end: 400,
                      number: Number.none,
                      secondsMarker: SecondsMarker.minutes,
                      isCircle: false,
                      hand: Hand.none,
                      counterAlign: CounterAlign.center,
                      counterStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 17,
                      ),
                      isDecimal: false,
                    ),

                    SizedBox(height: 30,),


                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 130,),

                    BudgetValue<CurrentValue?
                    Center(
                      child: Text(
                          "!!Too much!!",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )
                      ),
                    ) :
                    IndexValue(CurrentValue,BudgetValue)<130?
                    Center(
                      child: Text(
                          "Doing fine!!",
                          style: TextStyle(
                            color: ColourList.ChartTitleTextColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )
                      ),
                    ):
                    IndexValue(CurrentValue,BudgetValue)<260?
                    Center(
                      child: Text(
                          "Reaching!!",
                          style: TextStyle(
                            color: ColourList.ChartTitleTextColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )
                      ),
                    ) :
                    Center(
                      child: Text(
                          "Better caring!!",
                          style: TextStyle(
                            color: ColourList.ChartTitleTextColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          )
                      ),
                    ),
                    SizedBox(height: 1,),
                    Center(
                      child: Text(
                          "Current : ${FiltersForTheApp.CurrentCurrencyType}${CurrentValue}",
                          style: TextStyle(
                            color: ColourList.ChartTitleTextColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          )
                      ),
                    ),
                    SizedBox(height: 1,),
                    Center(
                      child: Text(
                          "Budget : ${FiltersForTheApp.CurrentCurrencyType}${BudgetValue}",
                          style: TextStyle(
                            color: ColourList.ChartTitleTextColor,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          )
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
