import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Auth_Message extends StatefulWidget {
  const Auth_Message({Key? key}) : super(key: key);

  @override
  _Auth_MessageState createState() => _Auth_MessageState();
}

class _Auth_MessageState extends State<Auth_Message> {

  bool? _hasBioSensor;

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
    bool isAuth = false;

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
        Navigator.of(context).pop();
        // Navigator.of(context).pushNamed("homepage");
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

    // call method immediately when app launch
    _checkBio();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: ElevatedButton(
          child: const Text('Check Auth'),
          onPressed: () {
            _checkBio();
          },
          style: ElevatedButton.styleFrom(
            // shape: const StadiumBorder(),
              primary: Colors.transparent
          )
      ),
    );
  }
}

