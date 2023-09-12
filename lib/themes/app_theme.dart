import 'package:flutter/material.dart';
import 'package:arabic_korean_memo/themes/my_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    //----------------------------------- main THEME
    primaryColor: mainMint,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: accentColor,
      tertiary: secondaryBlue,
      onBackground: neutralWhte,
    ),

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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedItemColor: secondaryBlue,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
    ),

    //----------------------------------- expansionTile THEME
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: mainMint,
      textColor: Colors.black,
      iconColor: Colors.black,
      collapsedBackgroundColor: mainMint,
      collapsedTextColor: Colors.black,
      collapsedIconColor: Colors.black,
      tilePadding: EdgeInsets.all(2),
    ),
  );
}
