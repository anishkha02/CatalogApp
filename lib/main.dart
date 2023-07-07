import 'package:catalog_project/screens/cart_page.dart';
import 'package:catalog_project/screens/login.dart';
import 'package:catalog_project/utils/routes.dart';
import 'package:catalog_project/widgets/themes.dart';
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
      theme: MyTheme.lightTheme(context),

      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: "/home",
      routes: {
        "/": (context) => Home(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute:(context)=>CartPage()
      },
    );
  }
}
