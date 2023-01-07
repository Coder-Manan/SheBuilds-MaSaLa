import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Colors.white,
      cardLabelColor = Color(0xFF2C3635),
      scaffoldBackgroundColor = Color(0xFF385C58),
      gold = Color(0xFFEDCFD4);

  static final TextTheme _textTheme = TextTheme(
    headline1: const TextStyle(
        color: white, fontSize: 35, fontFamily: 'News Cycle Bold'),
    bodyText1: const TextStyle(
        color: white, fontSize: 15, fontFamily: 'Montserrat-Medium'),
    labelMedium: const TextStyle(
        color: cardLabelColor, fontSize: 24, fontFamily: 'News Cycle Bold'),
    labelSmall: const TextStyle(
        color: cardLabelColor, fontSize: 12, fontFamily: 'Montserrat-Regular'),
    titleMedium:
        const TextStyle(color: gold, fontSize: 18, fontFamily: 'Inter Bold'),
  );
}
