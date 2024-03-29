import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context)
    ;
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', image));
  }
}