import 'package:bmi_calculator/shear/style/app_color.dart';
import 'package:flutter/material.dart';

class App_Style{


 static Color scaffoldc=App_Colors.Scaffoldbacgroundcolor;
  static final ThemeData light_theme=ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor:scaffoldc,
    appBarTheme: AppBarTheme(backgroundColor:scaffoldc ),
  );


  static ThemeData Dark_theme=ThemeData();

}