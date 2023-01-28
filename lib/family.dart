// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'Database.dart';
import 'package:geolocator/geolocator.dart';

import 'constant.dart';

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  Database database=new Database();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAMILY MEMBERS",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child:Column(
        children:[
          Container(
            child:ShowWork(),
          ),
        ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final PhoneContact contact =await FlutterContactPicker.pickPhoneContact();
          print(contact.fullName);
          print(contact.phoneNumber!.number);
          database.uploadWork(contact.fullName!,contact.phoneNumber!.number!);
          //recipents.add(contact.phoneNumber!.number.toString());
          //_sendSMS(message, recipents);
        },
          splashColor: Colors.orange,
          backgroundColor: Colors.black,
          child: Icon(Icons.person_add_alt_1_rounded,color:Colors.white),
        ),
    );
  }
}
class ShowWork extends StatefulWidget {
  const ShowWork({super.key});
  @override
  State<ShowWork> createState() => _ShowWorkState();
}

class _ShowWorkState extends State<ShowWork> {
  bool isSelected=false;
  late Position _currentPosition;
  
  void initState(){
    super.initState();
    _getCurrentLocation();
  }
  _getCurrentLocation() async {
    try{

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high); 
 
      _currentPosition = position; 
      print("here is the location:$_currentPosition");    

    }catch(e){     
      print(e); 
    }    

  }
  List<String> recipents = [];
  void _sendSMS(String message, List<String> recipents) async {
 String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
print(_result);
}
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('contacts').doc(Constant.email).collection('list').snapshots(),
      builder:(context,snapshot){
        if(!snapshot.hasData){  
          return Center(
            child:CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          primary:true,
          itemCount:snapshot.data!.docs.length,
          itemBuilder:(context,index){
          QueryDocumentSnapshot x=snapshot.data!.docs[index];
          return ListTile(
            //tileColor:Colors.teal[500],
            shape:RoundedRectangleBorder(
              side:BorderSide(color:Colors.white,width:1),
              borderRadius:BorderRadius.circular(10)
            ),

            title:Text(x['name'],style:TextStyle(fontSize:20,color:Colors.blue[900],fontWeight: FontWeight.bold)),

            subtitle:Text(x['phone'],style:TextStyle(fontSize:15,color:Colors.blue[900],fontWeight: FontWeight.bold)),

            onLongPress: (){
            showAlert(context,x.id);
            },
            onTap:(){
              recipents.add(x['phone'].toString());
              String url="https://www.google.com/maps/search/?api=1&query=${_currentPosition.latitude},${_currentPosition.longitude}";
              String message = "Hi,Iam in trouble,please help me by reaching to below location urgently:$url";
              _sendSMS(message, recipents);
              recipents.clear();
            }
          );
          },
          );
        });
  }
  void showAlert(BuildContext context,String id) {
    var alertDialog = AlertDialog(
      title: Text("Delete",style:TextStyle(fontSize:30,color:Colors.red,fontWeight:FontWeight.bold)),
      content: Text("Are you sure you want to delete this Contact?",style:TextStyle(fontSize:20,color:Colors.blue,fontWeight:FontWeight.bold)),
      actions: <Widget>[
        ElevatedButton(
          style:ElevatedButton.styleFrom(
            primary:Colors.red[600],
          ),
          child: Text("Yes"),
          onPressed: (){
            FirebaseFirestore.instance.collection('contacts').doc("arjuntiwari754@gmail.com").collection('list').doc(id).delete();
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          style:ElevatedButton.styleFrom(
            primary:Colors.green[600],
          ),
          child: Text("No"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alertDialog);
    }
  }