import 'package:catalog_project/models/catalog.dart';
import 'package:catalog_project/widgets/drawer.dart';
import 'package:catalog_project/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days=30;

  final String name="Codepur";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
    //print(productsData);
  }
  @override
  Widget build(BuildContext context) {
    // final dummyList=List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catalog App")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)?
         GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             mainAxisSpacing: 16,
             crossAxisSpacing: 16,
           ),
           itemBuilder: (context,index){
             final item=CatalogModel.items[index];
             return Card(
               clipBehavior: Clip.antiAlias,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10)),
                 child: GridTile(
                   header: Container(
                     child: Text(item.name,
                     style: TextStyle(color: Colors.white),
                     ),

                     padding: const EdgeInsets.all(2),
                     decoration: BoxDecoration(
                       color: Colors.deepPurple,
                     ),
                   ),
                     child: Image.network(
                       item.image,

                     ),
                 footer: Container(
                   child: Text(item.price.toString(),
                     style: TextStyle(color: Colors.white),
                   ),

                   padding: const EdgeInsets.all(2),
                   decoration: BoxDecoration(
                     color: Colors.black,
                   ),
                 ),
                 )
             );
           },
           itemCount: CatalogModel.items.length,
         )
        // ListView.builder(
        //   itemCount: CatalogModel.items.length,
        //   itemBuilder: (context,index)=>ItemWidget(
        //       item: CatalogModel.items[index],
        //     ),
       // )
            :Center(child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),

    );
  }
}
