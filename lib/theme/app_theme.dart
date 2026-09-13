import 'package:flutter/material.dart';

const Color primaryPurple = Color(0xFF6633D6);
const Color lightPurple = Color(0xFFF1EDFF);
const Color darkText = Color(0xFF20212B);
const Color secondaryText = Color(0xFF77747F);
const Color appBorder = Color(0xFFE5E1EA);

ThemeData studyBuddyTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFFBFAFF),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryPurple),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFBFAFF),
    foregroundColor: darkText,
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: appBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: appBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: primaryPurple, width: 1.5),
    ),
  ),
);
