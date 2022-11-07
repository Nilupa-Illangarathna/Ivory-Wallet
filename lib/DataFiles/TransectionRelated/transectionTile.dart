
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/category_types.dart';
import '../../../Classes/All Contralling Dart Files/TransectionsClass.dart';
import '../../../Classes/colors.dart';
import '../../../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import 'package:intl/intl.dart';
import '../../../DataFiles/Budget related/constants.dart';



class TransectionTile extends StatefulWidget {
  // const TransectionTile({Key? key}) : super(key: key);

  final item;
  TransectionTile(this.item);


  @override
  _TransectionTileState createState() => _TransectionTileState(item);
}

class _TransectionTileState extends State<TransectionTile> {

  final item;
  _TransectionTileState(this.item);


  final double elevationvalue=FiltersForTheApp.elevationvalue;

  double heightfactor=0.14 * FiltersForTheApp.TransectionsTilesScaleFactor;
  double widthfactor=1.0 * FiltersForTheApp.TransectionsTilesScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width* widthfactor,
              height: MediaQuery.of(context).size.height * heightfactor,
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: item.ButtonColor.withOpacity(0.8),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(right: 0, left:0 , bottom: 0, top: 0),
              // padding: EdgeInsets.all(6),
              child:ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  elevation: elevationvalue*4,
                  primary: Colors.white70,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height * heightfactor,
                      width: MediaQuery.of(context).size.width * 0.73 * widthfactor,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 80,
                            top: -10,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * heightfactor*3,
                              width: MediaQuery.of(context).size.width * heightfactor*3,
                              child: Image.asset(item.IconAddress,fit: BoxFit.fill,color: item.ButtonColor.withOpacity(0.2),),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 10,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width * heightfactor*1.6,
                              width: MediaQuery.of(context).size.width * heightfactor*1.6,
                              child: Image.asset(item.IconAddress,fit: BoxFit.fill,color: item.ButtonColor.withOpacity(0.7),),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.01 * widthfactor,),
                                  Expanded(
                                    child: Text(
                                      "${item.CategoryName}",
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width * 0.058 * widthfactor,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.02 * widthfactor,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).size.width * 0.02 * widthfactor,),
                                      Text(
                                        "${item.CategoryType}",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.025 * widthfactor,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width * 0.3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${FiltersForTheApp.CurrentCurrencyType}${item.TransectionAmount}",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width * 0.073 * widthfactor,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black.withOpacity(0.73),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(),
                            ],
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.32 * widthfactor,
                            child: SizedBox(
                              width:MediaQuery.of(context).size.width * 0.45 * widthfactor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:MediaQuery.of(context).size.width * 0.45 * widthfactor,
                                    height:MediaQuery.of(context).size.height * 0.13 * widthfactor,
                                    color: Colors.transparent,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // SizedBox(),
                                        // SizedBox(),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item.AccountData} payment",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.035 * widthfactor,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black.withOpacity(0.7),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "${DateFormat.jm().format(item.Date)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.03 * widthfactor,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black.withOpacity(0.6),
                                              ),
                                            ),
                                            Text(
                                              "${DateFormat.y().format(item.Date)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04 * widthfactor,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black38,
                                              ),
                                            ),
                                            SizedBox(),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${DateFormat.MMMMEEEEd().format(item.Date)}",
                                              style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.03 * widthfactor,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black38,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(),
                                        // SizedBox(),
                                      ],
                                    ),
                                  ),

                                ],

                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026 * widthfactor),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (item.ButtonColor).withOpacity(0.8),
                        ),
                        height: MediaQuery.of(context).size.width *1.3* heightfactor,
                        width: MediaQuery.of(context).size.width * 0.12 * widthfactor,
                        child: Image.asset(item.IconAddress)
                    ),


                    // Container(
                    //     padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026 * widthfactor),
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: (item.ButtonColor).withOpacity(0.8),
                    //     ),
                    //     height: MediaQuery.of(context).size.width *1.3* heightfactor,
                    //     width: MediaQuery.of(context).size.width * 0.12 * widthfactor,
                    //     child: Image.asset(item.IconAddress)
                    // ),
                    // SizedBox(width: 40,)
                  ],
                ),
              ),

            ),

            SizedBox(height: 10,),

          ],
        ),

        // SizedBox(
        //   height: MediaQuery.of(context).size.width * heightfactor*2,
        //   width: MediaQuery.of(context).size.width * heightfactor*2,
        //   child: Image.asset(item.IconAddress,fit: BoxFit.fill,),
        // ),
        // Container(
        //     padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.026 * widthfactor),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: (item.ButtonColor).withOpacity(0.8),
        //     ),
        //     height: MediaQuery.of(context).size.width *1.3* heightfactor,
        //     width: MediaQuery.of(context).size.width * 0.12 * widthfactor,
        //     child: Image.asset(item.IconAddress)
        // ),

      ],
    );
  }
}


// Icon(
// Icons.favorite,
// color: Colors.red,
// size: 35,
// ),


