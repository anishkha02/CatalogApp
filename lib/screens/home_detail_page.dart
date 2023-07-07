import 'package:catalog_project/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(

          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:EdgeInsets.zero ,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darBluishColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())
              ),
              child: "Buy".text.make(),
            ).wh(100, 40)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column
                      (
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darBluishColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).make(),
                        10.heightBox,
                      ],
                    ).py64(),

            ),
                ))
          ],
        ),
      ),
    );
  }
}
