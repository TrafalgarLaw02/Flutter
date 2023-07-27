import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_2/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_application_2/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}"
                .text
                .xl4
                .color(context.theme.backgroundColor)
                .make(),
            AddtoCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ),
            ).h32(context),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.convey,
                    edge: VxEdge.top,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.theme.focusColor)
                              .make(),
                          10.heightBox,
                          "${catalog.name} Action Figure".text.xl.make().p16(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
