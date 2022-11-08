import 'package:catalog_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // bool isFemale=true;
    //
    // num date=23.5;
    // var temp="forty six";
    // const pi=3.14;
    // final day =34;
    //final and constant mai difference hota h that in final we can modify the data or add the data but in const we cannot chnge the data ones initialized....



    return MaterialApp(
      //home:Home(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch:Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => Home(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
