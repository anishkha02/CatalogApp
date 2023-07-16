import 'package:catalog_project/core/store.dart';
import 'package:catalog_project/models/cart.dart';
import 'package:catalog_project/models/catalog.dart';
import 'package:catalog_project/utils/routes.dart';
import 'package:catalog_project/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days=30;

  final String name="Codepur";
  //final url="link of the file";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    //for the data taken from url json
    //final response=await http.get(Uri.parse(url));
    //final catalogJson=response.body;
    final decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
    //print(productsData);
  }
  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton:
      VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context,_,__)=> FloatingActionButton(
          onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(color: Vx.red500,size: 20,count: _cart.items.length,textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(child: CircularProgressIndicator().centered().expand(),)
            ],
          ),
        ),
      ),
    );
  }
}








