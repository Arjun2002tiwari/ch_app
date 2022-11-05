import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'dash.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMERGENCY CONTACTS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 224, 222, 222),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async =>
                  {await FlutterPhoneDirectCaller.callNumber("1091")},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                  "WOMAN HELPLINE NUMBER",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async =>
                  {await FlutterPhoneDirectCaller.callNumber("155620")},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                  "CYBER CRIME HELPLINE",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async =>
                  {await FlutterPhoneDirectCaller.callNumber("10921")},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                  "AIWC",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async =>
                  {await FlutterPhoneDirectCaller.callNumber("(011) 23973949")},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
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
                  "Nari Raksha Samiti",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
