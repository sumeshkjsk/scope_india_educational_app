import 'package:flutter/material.dart';
import 'color_theme.dart';

class AppTheme{
  static _border([Color color = AppColor.borderColor]) => OutlineInputBorder(

    borderSide : BorderSide(
      color : color,
      width : 3,
    ),
    borderRadius : BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor : AppColor.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );

}