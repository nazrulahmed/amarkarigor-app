import 'package:flutter/material.dart';

class MyColors {
  static final colorPrimary = Color(0xff1DBF73);
}

class MyButtonStyle {
  static final submitButton = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      primary: MyColors.colorPrimary,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20));
}

class MyTextStyle {
  static final textWhiteExtraLargeBold =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
  static final textWhiteLargerBold =
      TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
  static final textWhiteLargeBold =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  static final textWhiteLarge = TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal);

  static final textWhiteMedium = TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal);
  static final textWhiteMediumBold =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  static final textWhiteSmall = TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal);

  static final textBlackLargerBold =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  static final textBlackLargeBold =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  static final textBlackMediumBold =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
}
