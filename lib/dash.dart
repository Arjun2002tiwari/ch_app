// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ch_app/laws.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'Location.dart';
import 'emergency.dart';
import 'family.dart';

class Dash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Dash> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RAKSHAQ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFC8479D),
                    Color(0XFFE8884C),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(""),
                backgroundColor: Colors.grey,
              ),
              accountName: Text("arjun"),
              accountEmail: Text("arjuntiwari754@gmail.com"),
            ),
            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.person),
              // onTap: (){

              // },
            ),
            ListTile(
              title: Text("About"),
              trailing: Icon(Icons.home),
              // onTap: (){
              //   Navigator.pop(context);
              // },
            ),
            ListTile(
              title: Text("Log Out"),
              trailing: Icon(Icons.logout_outlined, color: Colors.grey),
              // onTap: (){
              //   setState(() {
              //     sort=!sort;
              //   });
              //},
            ),
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC8479D),
                Color(0XFFE8884C),
              ],
            ),
          ),
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                  color: Colors.white.withOpacity(0.7),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber("100");
                      },
                      splashColor: Colors.orange,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.local_police_outlined, size: 50.0),
                          Text("Call Police",
                              style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  color: Colors.white.withOpacity(0.7),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Family()));
                      },
                      splashColor: Colors.orange,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.message, size: 50.0),
                          Text("Message Family",
                              style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  color: Colors.white.withOpacity(0.7),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Location()));
                      },
                      splashColor: Colors.orange,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.location_on, size: 50.0),
                          Text("Nearby Police",
                              style: new TextStyle(fontSize: 17.0)),
                          Text("station",
                              style: new TextStyle(fontSize: 17.0))
                        ],
                      )))),
              Card(
                  color: Colors.white.withOpacity(0.7),
                  margin: EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Emergency()));
                      },
                      splashColor: Colors.orange,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.call, size: 50.0),
                          Text("Emergency",
                              style: new TextStyle(fontSize: 17.0)),
                          Text("Contacts",
                              style: new TextStyle(fontSize: 17.0))
                        ],
                      ))))
            ],
          )),
    );
  }
}
