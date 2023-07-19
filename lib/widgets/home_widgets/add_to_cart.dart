import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/cart.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;

  AddtoCart({super.key, required this.catalog});

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.add(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.backgroundColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
