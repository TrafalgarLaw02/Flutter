import "package:flutter/material.dart";
import "package:flutter_application_2/utlis/routes.dart";
import "package:flutter_application_2/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _fromKey = GlobalKey<FormState>();

  moveTohome(BuildContext context) async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

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
        color: context.canvasColor,
        child: Form(
          key: _fromKey,
          child: Material(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/shanks.jpeg",
                    width: 800,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "One Piece is Real",
                    style: TextStyle(
                      color: context.theme.focusColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 50.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password cannot be empty";
                            } else if (value!.length < 8) {
                              return "Password should be atleast 8 characters";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(changeButton ? 20 : 8),
                    child: InkWell(
                      splashColor: Colors.yellow,
                      onTap: () => moveTohome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  )
                  /*ElevatedButton(
                  child: Text("Login"),
                  style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                    
                  },
                )*/
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
