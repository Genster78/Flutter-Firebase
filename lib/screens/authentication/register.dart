import 'package:flutter/material.dart';
import 'package:flutter_firebase/constance/colors.dart';
import 'package:flutter_firebase/constance/styles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              const Text(
                "Welcome Onboard!",
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
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: buttonDecoration,
                      child: const Center(
                        child: Text(
                          "Register",
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account?",
                          style: TextStyle(
                            color: mainBlack.withOpacity(0.75),
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            color: acentcolor,
                            fontSize: 19,
                            fontWeight: FontWeight.w900
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
