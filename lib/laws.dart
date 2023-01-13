// ignore_for_file: prefer_const_constructors


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'dash.dart';

class Laws extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Laws> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "LAWS",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 239, 92, 19),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 150,
                    color: Color(0xFFDEDBD8),
                    child: Text(
                      "RAPE: Section 375 ,IPC defines rape.The offence of rape is the ravishment of a women , without her consent,by force,fraud or fear.Section 376 provides punishmnent of committing the heinous crime of rape.Section 376(1) provides a minimum sentence of seven years of imprisonment that may extend to life imprisonment and fine.Section(2) provides punishment not less than 10 years of imprisonment but may extend for life or death. ",
                    ))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  color: Color(0xFFAEE2F7),
                  child: Text(
                      "ACID ATTACK: Section-326B-VOLUNTARILY THROWING OR ATTEMPTING TO THROW ACID-Whoever throw or attempts to throw acid on any person or attempts to administer acid to any person.Punishment-5 years (may extend to seven years and also be liable to fine.SECTION 326A-GREVIOUS HURT BY USE OF ACID – Whoever causes permanent or partial damage, burn or disables any part of persons body or causes grievous hurt by throwing acid and with the knowledge or intention to cause hurt or injury.Punishment-10 years (not less than ten years but may extend to life imprisonment with fine."),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 200,
                    color: Color(0xFFDEDBD8),
                    child: Text(
                        "KIDNAPPING: Section 360 explains kidnapping from India. According to section 360, if any person takes a person beyond the limits of India against the consent of that person or against the consent of someone who is legally entitled to give consent on that person’s behalf, then the offence of kidnapping from India is committed.Kidnapping and Abduction are the crime under Indian Penal Code,1860. It talks about the forcefully taking of the person or a child (from guardianship) with or without the consent for that matter. Both the offences are given under Chapter 26 – Offences affecting the Human Body, particularly from section 359 to 366 of Indian Penal code. "))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 120,
                    color: Color(0xFFAEE2F7),
                    child: Text(
                        " SEXUAL HARRASMENT: The Sexual Harassment of Women at Workplace (Prevention, Prohibition and Redressal) Act was passed in 2013. It defined sexual harassment, lay down the procedures for a complaint and inquiry, and the action to be taken. It broadened the Vishaka guidelines, which were already in place."))),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            IconButton(onPressed: (){
              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dash()));
            }, 
            icon:Icon(Icons.sos),
            ),
            IconButton(
            onPressed: (){}, 
            icon:Icon(Icons.safety_check),
            ), 
            IconButton(onPressed: (){
               Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Laws()));
            }, 
            icon:Icon(Icons.rule)
            )
          ],
          backgroundColor: Color(0xFFE66216),
          color: Colors.grey.withOpacity(0.9)),
        );

  }
}
