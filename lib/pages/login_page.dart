import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_application_2/pages/home_page.dart";
import "package:flutter_application_2/utlis/routes.dart";
import "package:flutter_application_2/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await (Firebase.initializeApp());
    return firebaseApp;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LoginPage();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//LoginFunction
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("NO User found for that eamil");
      }
    }
    return user;
  }

  String name = "";
  bool changeButton = false;
  // final _fromKey = GlobalKey<FormState>();

  // moveTohome(BuildContext context) async {
  //   if (_fromKey.currentState!.validate()) {
  //     setState(() {
  //       changeButton = true;
  //     });
  //     await Future.delayed(Duration(seconds: 1));
  //     await Navigator.pushNamed(context, MyRoutes.homeRoute);
  //     setState(() {
  //       changeButton = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
//textfiled  Controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
          // key: _fromKey,
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
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: "Enter Email",
                            labelText: "Email",
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "username cannot be empty";
                          //   }
                          //   return null;
                          // },
                          // onChanged: (value) {
                          //   name = value;
                          //   setState(() {});
                          // },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "password cannot be empty";
                          //   } else if (value!.length < 8) {
                          //     return "Password should be atleast 8 characters";
                          //   }
                          // },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //App Test

                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => HomePage())));
                      }
                    },
                    child: Material(
                      color: context.theme.focusColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 20 : 8),
                      child: InkWell(
                        splashColor: Colors.yellow,
                        // onTap: () => moveTohome(context),
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
                                    color: context.theme.canvasColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text("Doesnt have account"),
                  ElevatedButton(
                    child: Text("Signup"),
                    style: TextButton.styleFrom(minimumSize: Size(10, 10)),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.SignupRoute);
                    },
                  )
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
