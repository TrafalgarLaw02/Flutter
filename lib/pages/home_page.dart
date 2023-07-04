import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

import '../widgets/Item_Widget.dart';

class HomePage extends StatelessWidget {
  var name = "hi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.Items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatalogModel.Items[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
