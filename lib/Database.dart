import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  void uploadWork(String name,String phone) {
    FirebaseFirestore.instance.collection('contacts').doc("arjuntiwari754@gmail.com").collection("list").add({
      'name': name,
      'phone': phone,
    });
  }
}