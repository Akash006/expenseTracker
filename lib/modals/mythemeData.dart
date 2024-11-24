import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemeData {
  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.blue.shade800,
      centerTitle: true,
      elevation: 10,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
      ),
    ),

    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Raleway',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light, // Match brightness here
    ).copyWith(
      secondary: Colors.purple,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
        elevation: 10,
        shadowColor: Colors.grey,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
      displayMedium: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900),
      displaySmall: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 18, color: Colors.black),
      titleMedium: TextStyle(fontSize: 16, color: Colors.black),
      titleSmall: TextStyle(fontSize: 14, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
    ),

    iconTheme: const IconThemeData(color: Colors.blue),
    snackBarTheme: const SnackBarThemeData(
      elevation: 8,
      backgroundColor: Colors.pink,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),

    cardTheme: const CardTheme(
      color: Colors.blue,
      shadowColor: Colors.white12,
      elevation: 26,
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      textColor: Colors.white,
      iconColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    drawerTheme: DrawerThemeData(
      elevation: 8,
    ),

    dividerTheme: DividerThemeData(
        color: Colors.grey,
        thickness: 1,
        space: 2
    ),
  );

  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.indigo.shade800,
      centerTitle: true,
      elevation: 10,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 26,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
      ),
    ),
    primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Raleway',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.indigo,
      brightness: Brightness.dark, // Match brightness here
    ).copyWith(
      secondary: Colors.purple,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
        elevation: 10,
        shadowColor: Colors.grey,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontSize: 18),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w900),
      displayMedium: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w900),
      displaySmall: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
      headlineMedium: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontSize: 14, color: Colors.white),
      titleMedium: TextStyle(fontSize: 16, color: Colors.white),
      titleSmall: TextStyle(fontSize: 16, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
    ),

    iconTheme: const IconThemeData(color: Colors.indigoAccent),

    snackBarTheme: const SnackBarThemeData(
      elevation: 8,
      backgroundColor: Colors.white,
      actionTextColor: Colors.black,
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.indigo,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      textColor: Colors.white,
      iconColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),

    drawerTheme: DrawerThemeData(
      elevation: 8,
      backgroundColor: Colors.grey[900],
    ),

    cardTheme: const CardTheme(
      color: Colors.indigo,
      shadowColor: Colors.white10,
      elevation: 12,
    ),

  );
}
