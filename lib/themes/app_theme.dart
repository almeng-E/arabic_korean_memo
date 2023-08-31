import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    //----------------------------------- main THEME
    primaryColor: hermesOrange,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: hermesOrange),
    scaffoldBackgroundColor: Colors.white,

    //----------------------------------- appBar THEME
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),

    //----------------------------------- bottomNavi THEME
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor: Colors.black.withOpacity(0.75),
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
    ),

    //----------------------------------- expansionTileTheme
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: hermesOrange,
      textColor: Colors.black,
      iconColor: Colors.black,
      collapsedBackgroundColor: hermesOrange,
      collapsedTextColor: Colors.black,
      collapsedIconColor: Colors.black,
      tilePadding: EdgeInsets.all(2),
    ),
  );
}
