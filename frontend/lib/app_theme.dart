import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Colors.white,
      cardLabelColor = Color(0xFF2C3635),
      scaffoldBackgroundColor = Color(0xFF385C58),
      gold = Color(0xFFEDCFD4);

  static const TextTheme _textTheme = TextTheme(
    headline1:
        TextStyle(
        color: white, fontSize: 35, fontFamily: 'News Cycle Bold'),
    bodyText1:
        TextStyle(color: white, fontSize: 15, fontFamily: 'Montserrat Medium'),
    labelMedium: TextStyle(
        color: cardLabelColor, fontSize: 24, fontFamily: 'News Cycle Bold'),
    // labelSmall: const TextStyle(
    //     color: cardLabelColor, fontSize: 12, fontFamily: 'Montserrat-Regular'),
    bodyText2: TextStyle(color: gold, fontSize: 18, fontFamily: 'Inter'),
  );

  //App Theme
  static final ThemeData _theme = ThemeData(
    textTheme: _textTheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );

  static ThemeData get theme => _theme;
}
