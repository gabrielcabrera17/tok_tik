import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 21, 73, 4);

const List<Color> _colorTheme = [
  _customColor,
  Color.fromRGBO(255, 215, 64, 1),
  Colors.blueGrey,
  Colors.green,
  Colors.grey,
  Colors.black
];

class AppTheme {
  final int selectColor;

  AppTheme({ 
    this.selectColor = 0
  }): assert(selectColor >=0 && selectColor <=_colorTheme.length - 1,
  'el tema debe estar entre 0 y ${_colorTheme.length}');


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: _colorTheme[selectColor],
  );

}