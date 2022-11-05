// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  late GoogleMapController _googleMapController;
  CameraPosition initialCameraPosition=CameraPosition(target: LatLng(37.42,-122.08),zoom: 14);
  Set<Marker> markers={};

  @override
  void initState(){
    super.initState();
    _determinePos();
  }

  void _determinePos() async{
    bool serviceEnanbled;
    LocationPermission permission;

    serviceEnanbled=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnanbled){
      print("location services are disabled!");
    }

    permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission=await Geolocator.requestPermission();

      if(permission==LocationPermission.denied){
        print("location services are disabled!");
      }
    }
    Position position=await Geolocator.getCurrentPosition();
    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:LatLng(position.latitude, position.longitude),zoom:14)));

    //markers.clear();
    markers.add(Marker(markerId:MarkerId('currentLocation'),position: LatLng(position.latitude,position.longitude)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("map"),
        centerTitle: true,
      ),
      body:GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _googleMapController=controller;
        }),
    );
  }
}