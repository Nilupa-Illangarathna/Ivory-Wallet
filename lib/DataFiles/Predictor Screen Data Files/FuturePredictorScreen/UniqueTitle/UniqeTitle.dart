import '../SettingsForFuturePrediction/fitness_app_theme.dart';
import 'package:flutter/material.dart';
import '../../../../Widgets/Charts/predictorBubbleChart.dart';


class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TitleView(
      {Key? key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);



  void _ShowCharts(BuildContext ctx, String categoryName){

    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: new BoxDecoration(
          color: Colors.transparent,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        child: Container(
          decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0))),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 700,
                  width: 1300,
                  color: Colors.transparent,
                  child: categoryName=="Expenses"?
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: PredictorBubbleChart(0.96,0.4,"Expenses"),
                  )
                      :
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: PredictorBubbleChart(0.96,0.4,"Incomes"),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );


    // showModalBottomSheet<dynamic>(
    //     isScrollControlled: true,
    //     context: ctx,
    //     builder: (BuildContext bc) {
    //       return Wrap(
    //           children: <Widget>[
    //             Container(
    //               color: Color(0xFF737373),
    //               child: Container(
    //                 decoration: new BoxDecoration(
    //                     color: Color(0xFF737373),
    //                     borderRadius: new BorderRadius.only(
    //                         topLeft: const Radius.circular(25.0),
    //                         topRight: const Radius.circular(25.0))),
    //                 child: SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Row(
    //                     children: [
    //                       Container(
    //                         height: 700,
    //                         width: 1300,
    //                         color: Colors.transparent,
    //                         child: categoryName=="Expenses"?
    //                         Padding(
    //                           padding: const EdgeInsets.all(24.0),
    //                           child: PredictorBubbleChart(0.96,0.4,"Expenses"),
    //                         )
    //                             :
    //                         Padding(
    //                           padding: const EdgeInsets.all(24.0),
    //                           child: PredictorBubbleChart(0.96,0.4,"Incomes"),
    //                         ),
    //
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             )
    //           ]
    //       );
    //     }
    // );



    // showModalBottomSheet(backgroundColor:Colors.transparent,isDismissible: true, enableDrag: true, context: ctx, builder: (_){
    //
    //
    //   return
    //     SizedBox(
    //       height: 1500,
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           children: [
    //             Container(
    //               height: 700,
    //               width: 1300,
    //               color: Colors.transparent,
    //               child: categoryName=="Expenses"?
    //               Padding(
    //                 padding: const EdgeInsets.all(24.0),
    //                 child: PredictorBubbleChart(0.96,0.4,"Expenses"),
    //               )
    //                   :
    //               Padding(
    //                 padding: const EdgeInsets.all(24.0),
    //                 child: PredictorBubbleChart(0.96,0.4,"Incomes"),
    //               ),
    //
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    // }
    // );

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: FitnessAppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: FitnessAppTheme.lightText,
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      onTap: () {

                        if(subTxt=="Expenses"){
                          _ShowCharts(context,"Expenses");
                        }
                        else{
                          _ShowCharts(context, "Incomes");
                        }


                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${subTxt}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: FitnessAppTheme.fontName,
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                                letterSpacing: 0.5,
                                color: FitnessAppTheme.nearlyDarkBlue,
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 26,
                              child: Icon(
                                Icons.arrow_forward,
                                color: FitnessAppTheme.darkText,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
