import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/BudgetsList.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import '../SettingsForFuturePrediction/fitness_app_theme.dart';
import 'meals_list_data.dart';
import 'package:flutter/material.dart';
import '../../DataGenerators/PredictionDataFIles.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import '../../../../Classes/enums.dart';
import '../../DataGenerators/PredictionDataFIles.dart';
import '../WaterFilledBarIndicator/wave_view.dart';
import 'package:flutter/material.dart';
import '../../../../Classes/colors.dart';
import '../../../../Widgets/category_button.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import '../../../../Classes/ChartData.dart';
import '../../../../DataFiles/Budget related/constants.dart';
import '../../../../Widgets/Charts/Gauge.dart';
import '../../../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';

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






class GaugesList extends StatefulWidget {
   GaugesList(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation,required this.IncomeOrExpense,this.Width,this.Height,this.CategoriesList,this.BudgetsList,this.SetOfIndexes})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final String IncomeOrExpense;


  final Width;
  final Height;
  final CategoriesList;
  final BudgetsList;
  final SetOfIndexes;

  @override
  _GaugesListState createState() => _GaugesListState(IncomeOrExpense,Width,Height,CategoriesList,BudgetsList,SetOfIndexes);
}

class _GaugesListState extends State<GaugesList> with TickerProviderStateMixin {
  AnimationController? animationController;

  var ColourList =ColorsClass();
  double elevationvalue=FiltersForTheApp.elevationvalue;
  String IncomeOrExpense;

  final Width;
  final Height;
  final CategoriesList;
  final BudgetsList;
  final SetOfIndexes;

  _GaugesListState(this.IncomeOrExpense,this.Width,this.Height,this.CategoriesList,this.BudgetsList,this.SetOfIndexes);


  List<MealsListData> mealsListData = [];

  List <Categories> horizontal_Tile_View_DataList = [];


  void SetListItems(Categories InputCategory){
    MealsListData temp = MealsListData(
      imagePath: InputCategory.IconAddress,
      titleTxt: InputCategory.CategoryName,
      kacl: InputCategory.CurrentSum.toDouble(),
      meals: <String>[
        InputCategory.CategoryType,
        "Current sum : ",
        "    ${InputCategory.TransectionAmount}"

      ],
      startColor: InputCategory.ButtonColor,
      endColor: InputCategory.EndColor,
    );

    mealsListData.add(temp);
  }


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

    horizontal_Tile_View_DataList=horizontal_Tile_View_Data(IncomeOrExpense=="Incomes"? "Incomes": "Expense" ,PrecictionPageData.getTotalPredictedPerEachCategory);
    mealsListData=[];
    for(int i=0;i<horizontal_Tile_View_DataList.length;i++){
      SetListItems(horizontal_Tile_View_DataList[i]);
    }




    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child:
            Container(
              height: Height*1.4,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: BudgetsList.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                  40;
                  final Animation<double> animation =
                  Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.elasticInOut)));
                  animationController?.forward();

                  return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: animation!,
                        child: Transform(
                            transform: Matrix4.translationValues(
                                100 * (1.0 - animation!.value), 0.0, 0.0),
                            child:Container(
                                height: Height*1.2,
                                width: Width*0.9,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(Radius.circular(20),
                                  ),
                                  // boxShadow: [kBoxShadow],
                                ),
                                child: Stack(
                                  children: [

                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 50,top: 65),
                                        child: BudgetsList[index].TransectionAmount==0?
                                        Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                width: Width*0.65,
                                                height: Width*0.65,
                                                decoration: BoxDecoration(
                                                  color: Colors.black26.withOpacity(0.02),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(25),
                                                  child: Image.asset(BudgetsList[index].IconAddress,color: BudgetsList[index]!.ButtonColor.withOpacity(0.3),),
                                                ),
                                              ),
                                            ),


                                            Center(
                                                child:
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Center(
                                                        child:Text(
                                                          "${BudgetsList[index].CategoryName}",
                                                          style: TextStyle(
                                                            color: ColourList.ChartTitleTextColor,
                                                            fontFamily: 'Roboto',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 24,
                                                          ),
                                                        )
                                                    ),
                                                    Center(
                                                        child: Text(
                                                          "Set Budget",
                                                          style: TextStyle(
                                                            color: ColourList.ChartTitleTextColor,
                                                            fontFamily: 'Roboto',
                                                            fontWeight: FontWeight.w800,
                                                            fontSize: 21,
                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                )
                                            ),
                                          ],
                                        )


                                            :
                                        GaugeTile(
                                            Width*0.9,
                                            Height,
                                            CategoriesList[index],
                                            BudgetsList[index]
                                        ),
                                      ),
                                    ),


                                    BudgetsList[index].TransectionAmount==0? Container(height: 0,width: 0,)
                                        :
                                    Positioned(
                                      top: Width*0.03,
                                      left: Width*0.45,
                                      child: Container(
                                        width: Width*0.45,
                                        height: Width*0.45,
                                        decoration: BoxDecoration(
                                          color: Colors.black26.withOpacity(0.04),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(25),
                                          child: Image.asset(BudgetsList[index].IconAddress,color: BudgetsList[index]!.ButtonColor,),
                                        ),
                                      ),

                                    ),
                                    // Positioned(
                                    //   top: Width*0.03,
                                    //   left: Width*0.55,
                                    //   child: SizedBox(
                                    //     width: 80,
                                    //     height: Width*0.5+80,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(13),
                                    //       child: Image.asset(BudgetsList[index].IconAddress,color: BudgetsList[index]!.ButtonColor,),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                )

                            ),
                        ),
                      );
                    },
                  );




                },
              ),
            ),
          ),
        );
      },
    );
  }
}

// class MealsView extends StatelessWidget {
//   const MealsView(
//       {Key? key, this.mealsListData, this.animationController, this.animation,required this.IncomeOrExpense})
//       : super(key: key);
//
//   final MealsListData? mealsListData;
//   final AnimationController? animationController;
//   final Animation<double>? animation;
//
//   final String IncomeOrExpense;
//
//   double GetBudgetValue(String CategoryName){
//     double ReturnVal=0;
//     for(int i=0;i<BudgetValues.length;i++){
//       if(CategoryName==BudgetValues[i].CategoryName){
//         ReturnVal=BudgetValues[i].TransectionAmount;
//       }
//     }
//     return ReturnVal;
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animationController!,
//       builder: (BuildContext context, Widget? child) {
//         return FadeTransition(
//           opacity: animation!,
//           child: Transform(
//             transform: Matrix4.translationValues(
//                 100 * (1.0 - animation!.value), 0.0, 0.0),
//             child:
//           ),
//         );
//       },
//     );
//   }
// }
