import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppConfig {
  final Color _colorMain = HexColor('#367E7E');
  final Color _colorText = HexColor('#7E7E7E');
  final Color _backColor = HexColor('#F7F7F7');
  final Color _backColorSelect = HexColor('#EBEBEB');
  final Color _colorMainMore = HexColor('#0A4646');
  final Color _colorBorder = Colors.grey.withOpacity(0.25);

  final double _paddingValue = 15.0;

  Color get colorMain => _colorMain;

  Color get colorText => _colorText;

  Color get backColor => _backColor;

  Color get backColorSelect => _backColorSelect;

  Color get colorMainMore => _colorMainMore;

  Color get colorBorder => _colorBorder;

  double get paddingValue => _paddingValue;
}

AppConfig appConfig = AppConfig();
