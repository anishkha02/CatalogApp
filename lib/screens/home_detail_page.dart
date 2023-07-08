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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor ,
        child: ButtonBar(

          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:EdgeInsets.zero ,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: (){},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())
              ),
              child: "Add to cart".text.color(Colors.white).make(),
            ).wh(120, 40)
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
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column
                      (
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).make(),
                        10.heightBox,
                        "Lorem ipsum dolor sit amet. Quo voluptas quae sed voluptas deleniti qui quam earum cum eveniet nulla. Qui quasi nostrum ut rerum deserunt in nihil tempora quo facere nostrum et velit reprehenderit qui corrupti quaerat sit quae sunt. Sit dolorum ipsa qui quia officiis et galisum delectus."
                            .text
                            .textStyle(context.captionStyle)
                            .make().p8()
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
