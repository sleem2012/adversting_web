import 'package:flutter/material.dart';

class MainTheme {
  static TextStyle textFormFieldTextStyle = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Cairo');

  static TextStyle headingTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Cairo');

  static TextStyle subTextStyle =
      TextStyle(fontSize: 15, color: Colors.grey[200], fontFamily: 'Cairo');

  static TextStyle errorTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red,
      fontFamily: 'Cairo');
  static TextStyle menuTextStyle =
      const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Cairo');
}
