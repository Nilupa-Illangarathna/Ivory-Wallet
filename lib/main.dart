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
import 'Pages/OverViewScreen.dart';


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

  var ColourList =ColorsClass();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,

      initialRoute: "fingerprint_page",

      routes: {
        "homepage": (context) => NavigationHomeScreen(),
        "incomes_page": (context) => IncomesPage(true),
        "expenses_page": (context) => ExpensesPage(false),
        "overview_page": (context) => OverViewScreen(),
        "transections_page": (context) => TransectionsList(),
        "budget_page": (context) => Explore(),
        "fingerprint_page": (context) => AuthPath(),
        "settings_page": (context) => SettingsPage(),
        "predictor_page": (context) => PredictorPage(),

      },
    );
  }
}

