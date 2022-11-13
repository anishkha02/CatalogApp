import 'package:catalog_project/widgets/drawer.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final int days=30;
    final String name="Codepur";
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catalog App")),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter!! $name"),
        ),
      ),
      drawer: MyDrawer(),

    );
  }
}
