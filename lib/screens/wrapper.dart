import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authentication/authenticate.dart';
import 'package:flutter_firebase/screens/home/home.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // the user data that the provide provides this can be a user data or can be null.
    final user = Provider.of<UserModel?>(context);
    print(user);
    
    if (user ==null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
