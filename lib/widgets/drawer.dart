import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/pages/home_page.dart";
import "package:flutter_application_2/pages/login_page.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLX9Yp77afmhb2Wio74oIF1Q6Gf-wj_3EAwA&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Shreyas"),
                  accountEmail: Text("shettyshreyash05@gmail.com"),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(imageUrl))),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
                title: Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                )),
            ListTile(
                onTap: () {
                  print("clicked");
                },
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                )),
          ],
        ),
      ),
    );
  }
}
