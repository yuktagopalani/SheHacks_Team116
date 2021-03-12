import 'package:flutter/material.dart';
import 'package:hobbyhub/screens/authenticate/tutor_register.dart';
import 'signin.dart';
import 'register.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn=true;
  void toggleView()
  {
    setState(() => showSignIn=!showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else{
      return Register(toggleView: toggleView);
//        return TutorRegister();
    }
  }
}
