import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authentication/register.dart';
import 'package:flutter_firebase/screens/authentication/signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signInPage = true;

  // toggle page function
  void switchPages (){
    setState(() {
      signInPage = !signInPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (signInPage == true){
      return SignIn(toggle: switchPages);
    } else {
      return Register(toggle: switchPages);
    }
  }
}
