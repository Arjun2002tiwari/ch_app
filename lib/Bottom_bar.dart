// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'dash.dart';
import 'laws.dart';
import 'safety.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex=0;
   var tabs=[Dash(),Safety(),Laws()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: tabs[_currentIndex]),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.orange,
      //   iconSize: 24,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //       BottomNavigationBarItem(
      //       icon: Icon(Icons.sos),
      //       //backgroundColor: Colors.black,
      //       label: '',
      //       activeIcon: Icon(Icons.sos_outlined),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.safety_check),
      //         //backgroundColor: Colors.black,
      //         label:"",
      //         activeIcon: Icon(Icons.safety_check_outlined)
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.rule),
      //        // backgroundColor: Colors.black,
      //         label:"",
      //         activeIcon: Icon(Icons.rule_outlined),
      //       ),
      //     ],
      //     //fixedColor: Colors.white,
      //     //unselectedItemColor: Colors.grey,
      //     currentIndex: _currentIndex,
      //     type: BottomNavigationBarType.fixed,


      //     onTap: (setValue){
      //       setState((){
      //         _currentIndex=setValue;
      //       });
      //     },
      //     ),
          
          bottomNavigationBar: CurvedNavigationBar(
            items:[
              Icon(Icons.sos),
              Icon(Icons.safety_check),
              Icon(Icons.rule)
            ],
            backgroundColor:Color.fromARGB(255, 239, 92, 19),
            color:Colors.grey,
            onTap: (index){
              setState((){
              _currentIndex=index;
            });
            },
          ),
          
    );
  }
}