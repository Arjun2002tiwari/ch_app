// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  late Position _currentPosition;
  List policeStations=[];

  @override
  void initState(){
    super.initState();
    _getCurrentLocation(); 
  }
  _getCurrentLocation() async {
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); 
      _currentPosition = position; 
      print(_currentPosition);
      String url = "https://nominatim.openstreetmap.org/search?q=police+station&format=json&limit=20&lat=${_currentPosition.latitude}&lon=${_currentPosition.longitude}";
    
    Uri uri = Uri.parse(url);
     var response = await http.get(uri);

     var jsonData = jsonDecode(response.body);

     setState(() {
       policeStations = jsonData;
       print(policeStations[5]['display_name']);
     }); 

    }catch(e){     
      print(e); 
    }    
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("map"),
        centerTitle: true,
      ),
      body: policeStations.isEmpty? Center( child: CircularProgressIndicator(), ) : ListView.builder( 
        itemCount: policeStations.isEmpty? 0 : policeStations.length, itemBuilder: (context, index) 
        { 
          return Card( 
            child: Padding( 
              padding: const EdgeInsets.all(8), 
              child: Text("${policeStations[index]["display_name"]}"),
            ),);
        },),
    );
  }
}