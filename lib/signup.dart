// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Database.dart';
import 'login.dart';
import 'Auth.dart';
import 'Bottom_bar.dart';
import 'package:RAKSHAQ/constant.dart';


class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _number = TextEditingController();
    final TextEditingController _password = TextEditingController();
    Database db = new Database();
    Auth auth = new Auth();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80)),
                  gradient: LinearGradient(colors: [
                    (new Color(0xFFC8479D)),
                    (new Color(0xFFE8884C))
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset("images/pic.png"),
                      height: 90,
                      width: 90,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _name,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Enter Your Full Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
                
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _number,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Enter Your Phone Number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _email,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Enter your Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.white)
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
            GestureDetector(
              onTap: () async {
                var isP = await db.checkuser(_email.text);
                if (isP) {
                  Fluttertoast.showToast(
                      msg: "User exist Already!",
                      backgroundColor: Color.fromARGB(255, 239, 92, 19),
                      textColor: Colors.white,
                      );
                } else {

                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', _name.text);
                  prefs.setString('email', _email.text);
                  Constant.name=_name.text;
                  Constant.email=_email.text;
                  db.uploadUserInfo(_name.text, _email.text, _number.text);
                  auth
                      .signupWithEmailAndPassword(_email.text, _password.text)
                      .then((val) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => BottomBar()));
                  });
                  Fluttertoast.showToast(
                      msg: "Sign Up Completed!",
                      backgroundColor: Color.fromARGB(255, 239, 92, 19),
                      textColor: Colors.white,
                    );
                }
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color(0xFFC8479D)),
                    (new Color(0xFFE8884C))
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
                  "Click here to Register",
                  style: TextStyle(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a Member?"),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()))
                    },
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
