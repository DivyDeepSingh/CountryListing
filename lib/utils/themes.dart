import 'package:country_sorting/utils/colors.dart';
import 'package:flutter/material.dart';

class CountryTheme {
  ThemeData get lightTheme => ThemeData(
      appBarTheme: AppBarTheme(
        color: CountryColors().kmatchTwoColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: CountryColors().kmatchOneColor,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        suffixIconColor: CountryColors().kmatchTwoColor,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        fillColor: CountryColors().kmatchTwoColor,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: CountryColors().kmatchTwoColor);
  ThemeData get darkTheme => ThemeData(
        appBarTheme: AppBarTheme(
            color: CountryColors().kmatchOneColor,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CountryColors().kmatchTwoColor,
            ),
            centerTitle: true),
        brightness: Brightness.light,
        scaffoldBackgroundColor: CountryColors().kmatchOneColor,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          suffixIconColor: CountryColors().kmatchOneColor,
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
        ),
      );
}
