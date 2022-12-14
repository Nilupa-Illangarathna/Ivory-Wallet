import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DataFiles/Budget related/shared.dart';
import '../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import '../../Shared_Preferences_DB/LoadingClass.dart';
import '../Classes/AccountsClass.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _DetailState();
}

class _DetailState extends State<SettingsPage> {


  bool FingerPrintOn = FiltersForTheApp.FingerPrintOn;
  double dropdownValue = FiltersForTheApp.elevationvalue;
  String CurrencyType= FiltersForTheApp.CurrentCurrencyType;
  String OverviwPastDaysToConsider=FiltersForTheApp.StartDaysPastFromNow.toString();
  String PredictionPastDaysToConsider=FiltersForTheApp.how_many_Days_pastData_To_Be_Considered.toString();
  bool VoiceRecognition=FiltersForTheApp.voiceRecognitionWant;
  String FrequntPaymentMethod=FiltersForTheApp.Is_Cash;

  Future LocalSet() async {
    if(FingerPrintOn!=FiltersForTheApp.FingerPrintOn){
      FiltersForTheApp.FingerPrintOn=FingerPrintOn;
    }
    if(dropdownValue!=FiltersForTheApp.elevationvalue){
      FiltersForTheApp.elevationvalue=dropdownValue;
    }
    if(CurrencyType!=FiltersForTheApp.CurrentCurrencyType){
      FiltersForTheApp.CurrentCurrencyType=CurrencyType;
    }
    if(OverviwPastDaysToConsider!=FiltersForTheApp.StartDaysPastFromNow){
      FiltersForTheApp.StartDaysPastFromNow=int.parse(OverviwPastDaysToConsider);
    }
    if(PredictionPastDaysToConsider!=FiltersForTheApp.how_many_Days_pastData_To_Be_Considered){
      FiltersForTheApp.how_many_Days_pastData_To_Be_Considered=int.parse(PredictionPastDaysToConsider);
    }
    if(VoiceRecognition!=FiltersForTheApp.voiceRecognitionWant){
      FiltersForTheApp.voiceRecognitionWant=VoiceRecognition;
    }
    if(FrequntPaymentMethod!=FiltersForTheApp.Is_Cash){
      FiltersForTheApp.Is_Cash=FrequntPaymentMethod;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(PredictionPastDaysToConsider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.settings,
              color: Colors.blue[800],
              size: MediaQuery.of(context).size.width*0.1,
            ),
          ),
        ],
      ),
      body:

      Stack(
        children: [


          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 70,),

                  Container(
                    padding: EdgeInsets.only(left: 16),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [

                          Container(
                            color: Colors.transparent,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(height: 6,),

                                      Text(
                                        "Set app settings",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      SizedBox(height: 6,),

                                      Row(
                                        children: [
                                          buildNutritions("Fingerprint on"),//////////////////////
                                        ],
                                      ),

                                      SizedBox(height: 6,),

                                      Text(
                                        "App Decorations",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),


                                      buildElevation("Elevation"),//////////////////////

                                      SizedBox(height: 6,),

                                      Text(
                                        "Currency type",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),


                                      buildCurrency("Set currency"),//////////////////////




                                      SizedBox(height: 6,),

                                      Text(
                                        "Voice Recognition",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      VoiceRecognitionFunc(),

                                      SizedBox(height: 6,),

                                      Text(
                                        "Payment Method",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      Cash_Or_Card_Function(),



                                      SizedBox(height: 6,),

                                      Text(
                                        "Overview Settings",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      OverviewStackedBarChartDaysToConsiderFunction(),

                                      SizedBox(height: 6,),

                                      Text(
                                        "Prediction Settings",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      PastDaysToConsiderFunction(""),


                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),


                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 16,left: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildTextTitleVariation1("Settings"), //Category name//////////////////
                            ElevatedButton(
                              onPressed: (){

                                LocalSet();
                                UserSecureStorage.setAll();
                              },
                              child: Text("Confirm"),

                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shadowColor: Colors.black,
                                padding:EdgeInsets.symmetric(horizontal: 40,vertical: 18),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Cash_Or_Card_Function(){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              "Frequent Payment Method  ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: 0.5,
                color: Color(0xFF4A6572).withOpacity(0.8),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    FrequntPaymentMethod=AccountsToShow[0];
                    print(FrequntPaymentMethod);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: FrequntPaymentMethod==AccountsToShow[0] ? Colors.blue : Colors.white,
                    shadowColor: FrequntPaymentMethod==AccountsToShow[0] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text(AccountsToShow[0],
                    style: TextStyle(
                      color: FrequntPaymentMethod==AccountsToShow[0] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    FrequntPaymentMethod=AccountsToShow[1];
                    print(FrequntPaymentMethod);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: FrequntPaymentMethod==AccountsToShow[1] ? Colors.blue : Colors.white,
                    shadowColor: FrequntPaymentMethod==AccountsToShow[1] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text(AccountsToShow[1],
                    style: TextStyle(
                      color: FrequntPaymentMethod==AccountsToShow[1] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }




  Widget VoiceRecognitionFunc(){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Enable Voice Recognition",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 0.5,
                  color: Color(0xFF4A6572).withOpacity(0.8),
                ),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.3,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    VoiceRecognition=!VoiceRecognition;
                    print(VoiceRecognition);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: VoiceRecognition? Colors.blue : Colors.white,
                    shadowColor: VoiceRecognition? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),
                        topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),
                        topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)
                    ),
                    ),
                  ),
                  child: Text(VoiceRecognition? "Enabled":"Disabled",
                    style: TextStyle(
                      color: VoiceRecognition? Colors.white : Colors.black54,
                    ),),
                ),
              ),


            ],
          ),


        ],
      ),
    );
  }


  Widget PastDaysToConsiderFunction( String title){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              "Days to be consider",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: 0.5,
                color: Color(0xFF4A6572).withOpacity(0.8),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    PredictionPastDaysToConsider=PredictionDaysToBeConsidered[0];
                    print(PredictionPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[0] ? Colors.blue : Colors.white,
                    shadowColor: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[0] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text(PredictionDaysToBeConsidered[0],
                    style: TextStyle(
                      color: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[0] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.14,

                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: (){
                    PredictionPastDaysToConsider=PredictionDaysToBeConsidered[1];
                    print(PredictionPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[1] ? Colors.blue : Colors.white,
                    shadowColor: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[1] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text(PredictionDaysToBeConsidered[1],
                    style: TextStyle(
                      color: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[1] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.14,

                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: (){
                    PredictionPastDaysToConsider=PredictionDaysToBeConsidered[2];
                    print(PredictionPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[2] ? Colors.blue : Colors.white,
                    shadowColor: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[2] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text(PredictionDaysToBeConsidered[2],
                    style: TextStyle(
                      color: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[2] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    PredictionPastDaysToConsider=PredictionDaysToBeConsidered[3];
                    print(PredictionPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    // elevation: 15,
                    primary: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[3] ? Colors.blue : Colors.white,
                    shadowColor: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[3] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text("Month",
                    style: TextStyle(
                      color: PredictionPastDaysToConsider.toString()==PredictionDaysToBeConsidered[3] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }


  Widget OverviewStackedBarChartDaysToConsiderFunction(){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              "Days to be consider",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 17,
                letterSpacing: 0.5,
                color: Color(0xFF4A6572).withOpacity(0.8),
              ),
            ),
          ),

          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    OverviwPastDaysToConsider=OverviewDaysToBeConsideredList[0];
                    print(OverviwPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[0] ? Colors.blue : Colors.white,
                    shadowColor: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[0] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text(OverviewDaysToBeConsideredList[0],
                    style: TextStyle(
                      color: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[0] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.14,

                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    OverviwPastDaysToConsider=OverviewDaysToBeConsideredList[1];
                    print(OverviwPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    // elevation: 15,
                    primary: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[1] ? Colors.blue : Colors.white,
                    shadowColor: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[1] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text(OverviewDaysToBeConsideredList[1],
                    style: TextStyle(
                      color: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[1] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.14,

                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: (){
                    OverviwPastDaysToConsider=OverviewDaysToBeConsideredList[2];
                    print(OverviwPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    // elevation: 15,
                    primary: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[2] ? Colors.blue : Colors.white,
                    shadowColor: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[2] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text(OverviewDaysToBeConsideredList[2],
                    style: TextStyle(
                      color: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[2] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    OverviwPastDaysToConsider=OverviewDaysToBeConsideredList[3];
                    print(OverviwPastDaysToConsider);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[3] ? Colors.blue : Colors.white,
                    shadowColor: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[3] ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text("Month",
                    style: TextStyle(
                      color: OverviwPastDaysToConsider.toString()==OverviewDaysToBeConsideredList[3] ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }


  Widget buildCurrency( String title){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Set currency",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: 0.5,
              color: Color(0xFF4A6572).withOpacity(0.8),
            ),
          ),


          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.width*0.1,
            child: TextField(
              onChanged: (val){
                CurrencyType=val;
              },
              decoration: InputDecoration(
                labelText: "Currently ${CurrencyType}",
                labelStyle: TextStyle(
                  color: Colors.indigo.withOpacity(0.3),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }




  Widget buildElevation(String title){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          Text(
            "Elevation",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: 0.5,
              color: Color(0xFF4A6572).withOpacity(0.8),
            ),
          ),

          Row(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    dropdownValue=1;
                    print(dropdownValue);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    // elevation: 15,
                    primary: dropdownValue.toString()=="1.0" ? Colors.blue : Colors.white,
                    shadowColor: dropdownValue.toString()=="1.0" ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text("1",
                    style: TextStyle(
                      color: dropdownValue.toString()=="1.0" ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: (){
                    dropdownValue=2;
                    print(dropdownValue);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: dropdownValue.toString()=="2.0" ? Colors.blue : Colors.white,
                    shadowColor: dropdownValue.toString()=="2.0" ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text("2",
                    style: TextStyle(
                      color: dropdownValue.toString()=="2.0" ? Colors.white : Colors.black54,
                    ),),
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(),
                child: ElevatedButton(
                  onPressed: (){
                    dropdownValue=3;
                    print(dropdownValue);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: dropdownValue.toString()=="3.0" ? Colors.blue : Colors.white,
                    shadowColor: dropdownValue.toString()=="3.0" ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.0),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.0)),
                    ),
                  ),
                  child: Text("3",
                    style: TextStyle(
                      color: dropdownValue.toString()=="3.0" ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.1,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                ),
                child: ElevatedButton(
                  onPressed: (){
                    dropdownValue=4;
                    print(dropdownValue);
                    setState(() {

                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: dropdownValue.toString()=="4.0" ? Colors.blue : Colors.white,
                    shadowColor: dropdownValue.toString()=="4.0" ? Colors.blue : Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                    ),
                  ),
                  child: Text("4",
                    style: TextStyle(
                      color: dropdownValue.toString()=="4.0" ? Colors.white : Colors.black54,
                    ),),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }


  Widget buildNutritions( String title){
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Fingerprint on",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: 0.5,
              color: Color(0xFF4A6572).withOpacity(0.8),
            ),
          ),
          Center(
            child:

            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03)),
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      FingerPrintOn=!FingerPrintOn;
                      print(FingerPrintOn);
                      setState(() {

                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: FingerPrintOn? Colors.blue : Colors.white,
                      shadowColor: FingerPrintOn? Colors.blue : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),
                          topLeft: Radius.circular(MediaQuery.of(context).size.width*0.03),
                          bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.03),
                          topRight: Radius.circular(MediaQuery.of(context).size.width*0.03)
                      ),
                      ),
                    ),
                    child: Text(FingerPrintOn? "Enabled":"Disabled",
                      style: TextStyle(
                        color: FingerPrintOn? Colors.white : Colors.black54,
                      ),),
                  ),
                ),


              ],
            ),

          ),


        ],
      ),
    );
  }
}

