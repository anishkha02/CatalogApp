import 'package:catalog_project/models/catalog.dart';
import 'package:catalog_project/widgets/drawer.dart';
import 'package:catalog_project/widgets/item_widget.dart';
import 'package:catalog_project/widgets/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
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
    return
     Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App".text.xl5.bold.color(MyTheme.darBluishColor).make(),
          "Trending products".text.xl2.make(),

        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(

          shrinkWrap: true,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context,index){
            final catalog=CatalogModel.items[index];
            return CatalogItem(catalog: catalog);
          },
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key,required this.catalog})
      :assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding:EdgeInsets.zero ,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darBluishColor,
                      ),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),
                      child: "Buy".text.make(),
                  )
                ],
              ).pOnly(right: 8)
            ],
          ))
          ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(
      image,
    ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context)
    ;
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', image));
  }
}



