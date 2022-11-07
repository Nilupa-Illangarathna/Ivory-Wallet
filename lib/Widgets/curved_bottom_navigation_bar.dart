import 'package:flutter/material.dart';
import '../Classes/colors.dart';
import '../Classes/All Contralling Dart Files/FiltersForAccounts.dart';
import 'dart:math';
import 'package:simple_cluster/src/hierarchical.dart';

class BottomNavBarV2 extends StatefulWidget {

  bool IsHomePage;
  BottomNavBarV2(this.IsHomePage);

  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State(IsHomePage);
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {

  bool IsHomePage;
  _BottomNavBarV2State(this.IsHomePage);

  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }




  void Heirarcical_Clusturing(){  //Function


    List<List<double>> singles = [[7], [10], [20], [28], [35],[9]];


    for(int i=0;i<40;i++){
      singles.add([Random().nextInt(100).toDouble()]);
    }




    Hierarchical hierarchical = Hierarchical(
        minCluster: 5, //stop at 2 cluster
        linkage: LINKAGE.SINGLE
    );

    print(singles);

    List<List<int>> clusterList2 = hierarchical.run(singles);

    print("===== 2 =====");
    print("Clusters output");
    print(clusterList2);//or hierarchical.cluster

    List <List <double>> ListOfItems=[];
    for(int i=0;i<clusterList2.length;i++){
      List <double> Temp=[];
      for(int j=0;j<clusterList2[i].length;j++){
        Temp.add(singles[clusterList2[i][j]][0]);
      }
      ListOfItems.add(Temp);
    }
    print("Clusters output");
    print(ListOfItems);//or hierarchical.cluster

    print("Noise");
    print(hierarchical.noise);
    print("Cluster label for points");
    print(hierarchical.label);
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 80,
            child: Stack(
              clipBehavior: Clip.none, children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(IsHomePage,context),
                  ),
                ),
                Center(
                  heightFactor: 0.6,
                  child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.home),
                      elevation: 0.1,
                      onPressed: () {


                        floatingActionButton: FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {},
                        );

                        if(ModalRoute.of(context)!.settings.name!='homepage'){
                          Navigator.of(context).popUntil(ModalRoute.withName('homepage'));
                          Navigator.of(context).pushNamed('homepage');
                        }

                      }),
                ),
                IsHomePage? Container(
                  width: size.width,
                  height: 80,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              size: MediaQuery.of(context).size.width*0.07,
                              color: currentIndex == 0 ? Colors.orange : Colors.grey.shade400,
                            ),
                            onPressed: () {

                              setBottomBarIndex(0);

                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.list,
                                size: MediaQuery.of(context).size.width*0.09,
                                color: currentIndex == 1 ? Colors.orange : Colors.grey.shade400,
                              ),
                              onPressed: () {

                                setBottomBarIndex(1);

                                Navigator.of(context).pushNamed("transections_page");
                                FiltersForTheApp.AccountType = "All Account";
                                FiltersForTheApp.IncomeOrExpense = "All Types";
                                FiltersForTheApp.ShowFavoritesOrBadSets = "No Filters";

                              }),
                          Container(
                            width: size.width * 0.20,
                            child: Hero(
                              tag: "assets/SettingsPage/Settings.jpg",
                              child: Container(
                                height: 0,
                                width: 0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  image: DecorationImage(

                                    image: AssetImage("assets/SettingsPage/Settings.jpg"),///////////////////////
                                    fit: BoxFit.fill,

                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.bookmark,
                                size: MediaQuery.of(context).size.width*0.07,
                                color: currentIndex == 2 ? Colors.orange : Colors.grey.shade400,
                              ),
                              onPressed: () {

                                setBottomBarIndex(2);
                                Navigator.of(context).pushNamed("budget_page");

                              }),
                          IconButton(
                              icon: Icon(
                                Icons.task,
                                size: MediaQuery.of(context).size.width*0.07,
                                color: currentIndex == 3 ? Colors.orange : Colors.grey.shade400,
                              ),
                              onPressed: () {
                                setBottomBarIndex(3);
                                Navigator.of(context).pushNamed("predictor_page");

                              }),
                        ],
                      ),
                    ],
                  ),
                ) : Container()
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  var ColourList =ColorsClass();
  var context;
  bool IsHomePage;
  BNBCustomPainter(this.IsHomePage,this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = IsHomePage? ColourList.HomePage_BNB_Colour : (ModalRoute.of(context)!.settings.name=='overview_page'? Colors.white.withOpacity(0.85) :(ModalRoute.of(context)!.settings.name=='transections_page'? Colors.black.withOpacity(0.4) :(ModalRoute.of(context)!.settings.name=='predictor_page'? Colors.white.withOpacity(0.85) :Colors.white)))
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
