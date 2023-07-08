import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) =>ThemeData(
    primarySwatch:Colors.deepPurple,
    cardColor: Colors.white,
    canvasColor:creamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: darkBluishColor,
    ),
    colorScheme: ColorScheme(
        secondary: darkBluishColor,
        brightness: Brightness.light,
        primary:Colors.white,
        onPrimary: Colors.white38,
        onSecondary: darkBluishColor,
        error: Colors.red,
        onError: Colors.red.shade200,
        background: creamColor,
        onBackground: creamColor,
        surface: Colors.white,
      onSurface: Colors.white
    ),
    //accentColor:darkBluishColor,
    //buttonColor: darBluishColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkBluishColor),
        // textTheme: Theme.of(context).textTheme,
        titleTextStyle:
        TextStyle(
            color:Colors.black
        )

    ),
  );

  static ThemeData darkTheme(BuildContext context) =>ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
     brightness: Brightness.dark,
    cardColor: Colors.black,
    canvasColor: darkcreamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: lightBluishColor,
    ),
    colorScheme: ColorScheme(
        secondary: lightBluishColor,
        brightness: Brightness.dark,
        primary:lightBluishColor,
        onPrimary:lightBluishColor,
        onSecondary: darkBluishColor,
        error: Colors.red,
        onError: Colors.red.shade200,
        background: darkcreamColor,
        onBackground: darkcreamColor,
        surface: Colors.white,
        onSurface: Colors.white
    ),
    primaryColor: Colors.white,
    hintColor:  Colors.white,
    //accentColor: Colors.white,
    //buttonColor: lightBluishColor,
    appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,
        titleTextStyle:
        TextStyle(
            color:Colors.black
        )

    ),
  );
  //Colors
  static Color creamColor=Color(0xfff5f5f5);
  static Color darkcreamColor=Vx.gray800;
  static Color darkBluishColor=Color(0xff403b58);
  static Color lightBluishColor=Vx.indigo400;
}