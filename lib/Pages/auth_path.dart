import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivorywalletsolution/Classes/All%20Contralling%20Dart%20Files/FiltersForAccounts.dart';
import 'package:local_auth/local_auth.dart';
import '../DataFiles/introduction_animation/components/Transections.dart';
import '../DataFiles/introduction_animation/components/center_next_button.dart';
import '../DataFiles/introduction_animation/components/OverviewInstructions.dart';
import '../DataFiles/introduction_animation/components/IncomeAndExpenses.dart';
import '../DataFiles/introduction_animation/components/LetsBegin.dart';
import '../DataFiles/introduction_animation/components/top_back_skip_view.dart';
import '../DataFiles/introduction_animation/components/welcome_view.dart';
import '../Shared_Preferences_DB/LoadingClass.dart';
import 'navigation_home_screen_with_App_Drawer.dart';
class AuthPath extends StatefulWidget {
  const AuthPath({Key? key}) : super(key: key);

  @override
  _AuthPathState createState() => _AuthPathState();
}

class _AuthPathState extends State<AuthPath> with TickerProviderStateMixin {

  bool? _hasBioSensor;
  bool isAuth = false;
  bool isLoading=true;
  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkBio() async{
    try{
      _hasBioSensor  = await authentication.canCheckBiometrics;
      print(_hasBioSensor);
      if(_hasBioSensor!){
        _getAuth();
      }
    }on PlatformException catch(e){
      print(e);
    }
  }

  Future<void> _getAuth() async{
    //loaded a dialog to scan fingerprint
    try{
      isAuth = await authentication.authenticate(
          localizedReason: 'Scan your finger print to access the app',
           biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true
      );
      //if fingerprint scan match then
      //isAuth = true
      // therefore will navigate user to WelcomePage/HomePage of the App
      if(isAuth){
        setState(() {

        });
      }
      print(isAuth);
    }on PlatformException catch(e){
      print(e);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshNotes2();
     // call method immediately when app launch
    if(FiltersForTheApp.FingerPrintOn){
      _checkBio();
    }

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
  }



  Future refreshNotes2() async {
    setState(() => isLoading = true);
    int now = await UserSecureStorage.GetAll();
    if(now==2){
      await addOrUpdateNote2();
    }
    setState(() => isLoading = false);
  }


  Future<int> addOrUpdateNote2() async {
    int now =await UserSecureStorage.setAll();
    return 0;
  }




  AnimationController? _animationController;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NavigationHomeScreen(),
          !isAuth && FiltersForTheApp.FingerPrintOn? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.60),
            child: ElevatedButton(
                child: Column(
                  children: [
                    Container(height: MediaQuery.of(context).size.height*0.3,),
                    Text(
                        'Who are you!!!',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.07,
                        fontWeight: FontWeight.w800,
                        color: Colors.white70,
                      ),
                    ),
                    Container(height: MediaQuery.of(context).size.height*0.06,),
                    Text(
                        "Touch and provide the fingerprint",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.05,
                        fontWeight: FontWeight.w800,
                        color: Colors.white70,
                      ),
                    ),
                  ],

                ),
                onPressed: () {
                  _checkBio();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                  elevation: 200,
                )
            ),
          ) :
          Container(
            height: 0,
            width: 0,
          ),

          FiltersForTheApp.FirstTime?
          (

              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ClipRect(
                  child: Stack(
                    children: [
                      SplashView(
                        animationController: _animationController!,
                      ),
                      RelaxView(
                        animationController: _animationController!,
                      ),
                      CareView(
                        animationController: _animationController!,
                      ),
                      MoodDiaryVew(
                        animationController: _animationController!,
                      ),

                      WelcomeView(
                        animationController: _animationController!,
                      ),
                      TopBackSkipView(
                        onBackClick: _onBackClick,
                        onSkipClick: _onSkipClick,
                        animationController: _animationController!,
                      ),
                      CenterNextButton(
                        animationController: _animationController!,
                        onNextClick: _onNextClick,
                      ),
                    ],
                  ),
                ),
              )

          ) :
          Container(
            height: 0,
            width: 0,
          ),
        ],
      ),

    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() async{
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      await _signUpClick();
      // onNextClicksetHHome;
    }
  }

  Future _signUpClick() async{
    await UserSecureStorage.checkFirstTimeWrite();
    await UserSecureStorage.setAll();
    await UserSecureStorage.GetAll();
    setState(() {

    });

  }
}
