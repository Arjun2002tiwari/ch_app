// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:async';

import 'package:RAKSHAQ/Bottom_bar.dart';
import 'package:RAKSHAQ/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'login.dart';


class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Constant().setVar();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }

  loginRoute() async {
    final prefs=await SharedPreferences.getInstance();
    if(prefs.getString('email')==null){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
    else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFC2B9BF),
                gradient: LinearGradient(colors: [
                  (Color(0xFFC8479D)),
                  (Color(0xFFE8884C)),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/pic.png"),
              Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'RAKSHAQ',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
