// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:RAKSHAQ/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bottom_bar.dart';
import 'dash.dart';
import 'signup.dart';
import 'Auth.dart';
import 'Database.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Login> {
  get auth => null;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    Database db = new Database();
    Auth auth = new Auth();
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular((90))),
                  color: Color(0xFFC2B9BF),
                  gradient: LinearGradient(colors: [
                    (const Color(0xFFC8479D)),
                    (const Color(0xFFE8884C))
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    child: Image.asset("images/pic.png"),
                    height: 90,
                    width: 90,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  )
                ],
              ))),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10), blurRadius: 50, color: Colors.white)
              ],
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: _email,
              cursorColor: Color(0xffF5591F),
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter your Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10), blurRadius: 50, color: Colors.white)
              ],
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: _password,
              obscureText: true,
              cursorColor: Color(0xffF5591F),
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter your Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10, right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forget Password ?"),
                onTap: () => {},
              )),
          GestureDetector(
            onTap: () async {
              var isP = await db.finduser(_email.text);
              auth
                  .signInWithEmailAndPassword(_email.text, _password.text)
                  .then((value) async {
                if (value != null) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', isP.toString());
                  prefs.setString('email', _email.text);
                  Constant.name = isP.toString();
                  Constant.email = _email.text;
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => BottomBar()));
                } else {
                  Fluttertoast.showToast(
                    msg: "Please check your credentials!",
                    backgroundColor:Color.fromARGB(255, 239, 92, 19),
                    textColor: Colors.white,
                  );
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  (const Color(0xFFC8479D)),
                  (const Color(0xFFE8884C))
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
              ),
              child: Text(
                "Click here to Login",
                style: TextStyle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have Account?"),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()))
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
