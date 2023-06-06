// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_firebase/constance/colors.dart';
import 'package:flutter_firebase/constance/styles.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  // toggle function
  final Function toggle;
  const SignIn({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // refference for AuthServices class
  final AuthServices _auth = AuthServices();

  // create form key
  final _formKey = GlobalKey<FormState>();

  //email password state
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              const Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 30, color: mainBlack),
              ),
              const SizedBox(height: 40),
              Image.asset(
                "assets/notifications.png",
                height: 250,
              ),
              const SizedBox(height: 50),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: inputTextStyle,
                      decoration: textInputFormDecoration,
                      validator: (value) =>
                          value!.isEmpty ? "Enter a valid email" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      style: inputTextStyle,
                      decoration: textInputFormDecoration.copyWith(
                          hintText: "Enter your password"),
                      validator: (value) => value!.isEmpty
                          ? "Password must be at least 8 charachters"
                          : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      //method for user sign in
                      onTap: () async {
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                        if (result == null) {
                          error = "User credential not found";
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: buttonDecoration,
                        child: const Center(
                          child: Text(
                            "Sign In",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      // method for user sign in anonnymous
                      onTap: () async {
                        dynamic result = await _auth.signInAnonymous();
                        if (result == Null) {
                          print("Error in sign in anon");
                        } else {
                          print("Sign in anon");
                          print(result.uid);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: buttonDecoration,
                        child: const Center(
                          child: Text(
                            "Sign in Anonymously",
                            style: buttonTextStyle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: mainBlack.withOpacity(0.75),
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          // method for navigate register page
                          onTap: () {
                            widget.toggle();
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: acentcolor,
                                fontSize: 19,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
