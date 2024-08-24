import 'package:flutter/material.dart';

final ThemeData textTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 22,
        fontWeight: FontWeight.w700), // inter bold
    titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w600), // inter semi bold
    titleSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w100), // inter extra light
    bodySmall: TextStyle(
        fontFamily: 'Questrial',
        fontSize: 12,
        fontWeight: FontWeight.w200), // Questrial light
    bodyMedium: TextStyle(
        fontFamily: 'Questrial',
        fontSize: 14,
        fontWeight: FontWeight.w500), // Questrial semi bold
    displayMedium: TextStyle(
      fontFamily: 'DMSans',
    ),
  
    headlineMedium: TextStyle(
      fontFamily: 'DMSerif',
    ),
    labelMedium: TextStyle(
      fontFamily: 'Lato',
    ),
    labelLarge: TextStyle(
      fontFamily: 'Annabelle',
    ),
  ),
);
