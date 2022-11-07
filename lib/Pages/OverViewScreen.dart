import '../DataFiles/Overview Datafiles/FuturePredictorScreen/SettingsForFuturePrediction/models/tabIcon_data.dart';
import 'package:flutter/material.dart';
import '../DataFiles/Overview Datafiles/FuturePredictorScreen/SettingsForFuturePrediction/fitness_app_theme.dart';
import '../DataFiles/Overview Datafiles/FuturePredictorScreen/WholePredictionBuild/PredictionScreen.dart';
import '../Widgets/curved_bottom_navigation_bar.dart';

class OverViewScreen extends StatefulWidget {
  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Stack(
          children: [
            MyDiaryScreen(animationController: animationController),
            BottomNavBarV2(false),
          ],
        ),
      ),
    );
  }
}
