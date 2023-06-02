import 'package:flutter/material.dart';
import 'package:flutter_firebase/constance/colors.dart';
import 'package:flutter_firebase/constance/styles.dart';
import 'package:flutter_firebase/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // refference for the AuthService class
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                  color: acentcolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 100),
                  Center(
                    child: Image.asset(
                      "assets/man.png",
                      height: 250,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Welcome Oliver Grace!",
                    style: TextStyle(color: mainWhite, fontSize: 30),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            "Good Evening!",
            style: TextStyle(
                color: mainBlack.withOpacity(0.84),
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Image.asset("assets/Clock.png", height: 170),
          const SizedBox(height: 50),
          GestureDetector(
            //log out
            onTap: () async {
              await _auth.signOut();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 55,
              decoration: buttonDecoration,
              child: const Center(
                child: Text(
                  "Log out",
                  style: buttonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
