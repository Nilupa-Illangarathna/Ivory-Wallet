import 'package:flutter/material.dart';
import './Classes/colors.dart';
import 'Pages/IncomesPage.dart';
import 'Pages/ExpensesPage.dart';
import 'Pages/Transections.dart';
import 'Pages/Budget.dart';
import 'package:flutter/services.dart';
import 'Pages/auth_path.dart';
import 'Pages/Settings.dart';
import 'Pages/navigation_home_screen_with_App_Drawer.dart';
import 'Pages/PredictorPage.dart';
import 'Test.dart';
import 'Pages/OverViewScreen.dart';

//README
//CHECK
//Assets ->fitnessapp folder
//Datafiles -> CURRENTLY WORKING ON



int GloableLoadingVariable=1;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  var ColourList =ColorsClass();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,


      // home: OverViewScreen(),
      //
      //
      initialRoute: "fingerprint_page",

      routes: {
        "testpage": (context) => Test(),
        "homepage": (context) => NavigationHomeScreen(),
        "incomes_page": (context) => IncomesPage(true),
        "expenses_page": (context) => ExpensesPage(false),
        // "overview_page": (context) => OverviewPage(),
        "overview_page": (context) => OverViewScreen(),
        "transections_page": (context) => TransectionsList(),
        "budget_page": (context) => Explore(),
        "fingerprint_page": (context) => AuthPath(),
        "settings_page": (context) => SettingsPage(),
        "predictor_page": (context) => PredictorPage(),
        // "introduction_page": (context) => IntroductionAnimationScreen(),
      },
      // home: LogoRotate(),
    );
  }
}

