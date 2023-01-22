import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  void uploadWork(String name,String phone) {
    FirebaseFirestore.instance.collection('contacts').doc("arjuntiwari754@gmail.com").collection("list").add({
      'name': name,
      'phone': phone,
    });
  }
  Future<bool> checkuser(String user) async{
    DocumentSnapshot<Map<String,dynamic>> document=await FirebaseFirestore.instance.collection('users').doc(user).get();
    if(document.exists){
      //print("present");
      return true;
    }
    return false;
  }

  uploadUserInfo(String Name,String email,String phone) async {
     await FirebaseFirestore.instance.collection('users').doc(email).set({
      'name':Name,
      'email': email,
      'phone':phone,
    });
  }
  
}