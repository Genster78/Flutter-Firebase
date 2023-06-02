import 'package:flutter/material.dart';

import 'colors.dart';

final textInputFormDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: TextStyle(
    color: mainBlack.withOpacity(0.5),
    fontSize: 16,
  ),
  filled: true,
  fillColor: mainWhite,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(50),
  ),
);

const inputTextStyle = TextStyle(
  color: mainBlack,
  fontSize: 18,
);

final buttonDecoration = BoxDecoration(
  color: acentcolor,
  borderRadius: BorderRadius.circular(50)
);

const buttonTextStyle = TextStyle(
                    color: mainWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  );
