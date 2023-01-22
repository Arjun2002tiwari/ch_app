import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signupWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(user?.uid);
      
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

// Future signInWithEmailAndPassword(String email,String password)async{
//   try{
//     UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
//     User? user=result.user;
//     print(user?.uid);
//     return user;
//     }
//     catch(e){
//       print(e.toString());
//     }
// }
// void signInWithEmailAndPassword() async {
//   final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
//     email: _emailController.text,
//     password: _passwordController.text,
//   )).user;
  
//   if (user != null) {
//     setState(() {
//       _success = true;
//       _userEmail = user.email;
//     });
//   } else {
//     setState(() {
//       _success = false;
//     });
//   }
// }


  Future signOut() async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.remove('email');
      // prefs.remove('name');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
  
}