import 'package:flutter/material.dart';
import 'home.dart';
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
      home:Home(),
    );
  }
}
