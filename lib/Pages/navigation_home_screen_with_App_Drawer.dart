import '../DataFiles/MainMenuRelated(Drawer and other screens)/app_theme.dart';
import 'custom_drawer_for_main_Menu/drawer_user_controller.dart';
import 'custom_drawer_for_main_Menu/home_drawer.dart';
import '../DataFiles/MainMenuRelated(Drawer and other screens)/feedback_screen.dart';
import '../DataFiles/MainMenuRelated(Drawer and other screens)/help_screen.dart';
// import '../../MainMenuRelated(Drawer and other screens)/HomeScreen/home_screen.dart';
import '../DataFiles/MainMenuRelated(Drawer and other screens)/invite_friend_screen.dart';
import 'package:flutter/material.dart';
import '../DataFiles/introduction_animation/introduction_animation_screen.dart';
import 'homepage.dart';
import 'Settings.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = HomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = InviteFriend();
          });
          break;
        case DrawerIndex.Settings:
          setState(() {
            screenView = SettingsPage();
          });
          break;
        case DrawerIndex.HelperScreen:
          setState(() {
            screenView = IntroductionAnimationScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
