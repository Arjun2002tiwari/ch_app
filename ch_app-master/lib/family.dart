// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  String message = "This is a test message!";
  List<String> recipents = ["+919837368791"];

  void _sendSMS(String message, List<String> recipents) async {
 String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
print(_result);
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Family Member",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[500],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final PhoneContact contact =await FlutterContactPicker.pickPhoneContact();
          print(contact.fullName);
          print(contact.phoneNumber!.number);
          //recipents.add(contact.phoneNumber!.number.toString());
          _sendSMS(message, recipents);
        },
          splashColor: Colors.orange,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person_add_alt_1_rounded,color:Colors.black),
        ),
    );
  }
}