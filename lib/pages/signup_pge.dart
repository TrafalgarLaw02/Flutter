import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utlis/routes.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "One Piece",
          style: TextStyle(color: context.theme.focusColor),
        ),
        centerTitle: true,
      ),
      body: Material(
          color: context.theme.canvasColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/shanks.jpeg",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.theme.backgroundColor),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          labelText: "Username",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      ElevatedButton(
                        child: Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
