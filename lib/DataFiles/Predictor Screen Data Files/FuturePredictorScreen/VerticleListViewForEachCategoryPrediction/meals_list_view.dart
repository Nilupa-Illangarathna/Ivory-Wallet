import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/BudgetsList.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import '../SettingsForFuturePrediction/fitness_app_theme.dart';
import 'meals_list_data.dart';
import 'package:flutter/material.dart';
import '../../DataGenerators/PredictionDataFIles.dart';
import '../../../../Classes/All Contralling Dart Files/category_types.dart';
import '../../../../Classes/enums.dart';
import '../WaterFilledBarIndicator/wave_view.dart';


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






class MealsListView extends StatefulWidget {
  const MealsListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation,required this.IncomeOrExpense})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final String IncomeOrExpense;

  @override
  _MealsListViewState createState() => _MealsListViewState(IncomeOrExpense);
}

class _MealsListViewState extends State<MealsListView> with TickerProviderStateMixin {
  AnimationController? animationController;


  String IncomeOrExpense;
  _MealsListViewState(this.IncomeOrExpense);


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
            child: Container(
              height: 260,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: mealsListData.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      mealsListData.length > 10 ? 10 : mealsListData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return MealsView(
                    mealsListData: mealsListData[index],
                    animation: animation,
                    animationController: animationController!,
                    IncomeOrExpense: IncomeOrExpense,
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

class MealsView extends StatelessWidget {
  const MealsView(
      {Key? key, this.mealsListData, this.animationController, this.animation,required this.IncomeOrExpense})
      : super(key: key);

  final MealsListData? mealsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  final String IncomeOrExpense;

  double GetBudgetValue(String CategoryName){
    double ReturnVal=0;
    for(int i=0;i<BudgetValues.length;i++){
      if(CategoryName==BudgetValues[i].CategoryName){
        ReturnVal=BudgetValues[i].TransectionAmount;
      }
    }
    return ReturnVal;
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: IncomeOrExpense=="Incomes"? MediaQuery.of(context).size.width * 0.42 : MediaQuery.of(context).size.width * 0.50,
              child: Flexible(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 32, left: 8, right: 8, bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                // color: HexColor(mealsListData!.endColor).withOpacity(0.6),
                                color: mealsListData!.endColor.withOpacity(0.6),
                                offset: const Offset(1.1, 4.0),
                                blurRadius: 8.0),
                          ],
                          gradient: LinearGradient(
                            colors: <Color>[
                              // HexColor(mealsListData!.startColor),
                              // HexColor(mealsListData!.endColor),
                              mealsListData!.startColor.withOpacity(0.8),
                              mealsListData!.endColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(54.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 54, left: 16, right: 16, bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                mealsListData!.titleTxt,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  letterSpacing: 0.2,
                                  color: FitnessAppTheme.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        mealsListData!.meals!.join('\n'),
                                        style: TextStyle(
                                          fontFamily: FitnessAppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          letterSpacing: 0.2,
                                          color: FitnessAppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              mealsListData?.kacl != 0
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            "${FiltersForTheApp.CurrentCurrencyType} ",
                                            style: TextStyle(
                                              fontFamily:
                                              FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              letterSpacing: 0.2,
                                              color: FitnessAppTheme.white,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            mealsListData!.kacl.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: FitnessAppTheme.fontName,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22,
                                              letterSpacing: 0.2,
                                              color: FitnessAppTheme.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: FitnessAppTheme.nearlyWhite,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: FitnessAppTheme.nearlyBlack
                                                  .withOpacity(0.4),
                                              offset: Offset(8.0, 8.0),
                                              blurRadius: 8.0),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.add,
                                          color: mealsListData!.endColor,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Image.asset(mealsListData!.imagePath,color: mealsListData!.startColor.withOpacity(1),),
                      ),
                    ),






                    IncomeOrExpense=="Incomes"? Container(
                      height: 0,
                      width: 0,
                    ):Positioned(
                      left: 130,
                      top: 60,
                      child: Container(
                        width: 40,
                        height: 160,
                        decoration: BoxDecoration(
                          color: mealsListData!.startColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(80.0),
                              bottomLeft: Radius.circular(80.0),
                              bottomRight: Radius.circular(80.0),
                              topRight: Radius.circular(80.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: FitnessAppTheme.grey.withOpacity(0.4),
                                offset: const Offset(4, 4),
                                blurRadius: 4),
                          ],
                        ),
                        child: WaveView(
                          percentageValue: GetBudgetValue(mealsListData!.titleTxt)==0? -20:(mealsListData!.kacl>GetBudgetValue(mealsListData!.titleTxt)? (mealsListData!.kacl/GetBudgetValue(mealsListData!.titleTxt))*100:(mealsListData!.kacl/GetBudgetValue(mealsListData!.titleTxt))*100),
                          BarColorDark: mealsListData!.startColor,
                          BarColor: Colors.blue,
                        ),
                      ),
                    ),



                    IncomeOrExpense=="Incomes"? Container(
                      height: 0,
                      width: 0,
                    ):(
                        GetBudgetValue(mealsListData!.titleTxt)==0?
                        Positioned(
                      left: 112,
                      top: 133,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotationTransition(
                            turns: new AlwaysStoppedAnimation(90 / 360),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Set Budget",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    color: FitnessAppTheme.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    :
                        (
                            (mealsListData!.kacl/GetBudgetValue(mealsListData!.titleTxt))*100>100?
                            Positioned(
                              left: 95,
                              top: 133,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RotationTransition(
                                    turns: new AlwaysStoppedAnimation(90 / 360),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Will Exceed!!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w900,

                                            fontSize: 19,
                                            letterSpacing: 0.0,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                                :
                            Container(
                              height: 0,
                              width: 0,
                            )
                        )
                    ),












                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
