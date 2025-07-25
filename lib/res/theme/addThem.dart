import 'package:buddy/res/contants/colors_contants.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorsContants.primaryColor,
      minimumSize: Size(200, 40),
      padding: EdgeInsets.symmetric(vertical: 16),
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600, // Optional: Add weight or style
        //color: Colors.white, // Optional: Set text color
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white, width: 1),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 28, 247, 163)
        .withOpacity(0.1), // Light background color

    // Invisible border with rounded corners
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),

    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    hintStyle: TextStyle(
      color: Color(0xFF7D8B91),
      fontSize: 14,
    ),
  ),
);
