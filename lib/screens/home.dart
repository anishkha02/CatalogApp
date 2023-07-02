import 'package:catalog_project/models/catalog.dart';
import 'package:catalog_project/widgets/drawer.dart';
import 'package:catalog_project/widgets/item_widget.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  final int days=30;
  final String name="Codepur";
  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catalog App")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),

    );
  }
}
