import 'package:shared_preferences/shared_preferences.dart';

class Constant{
  static String name="";
  static String email="";
  Future<void> setVar() async {
    final prefs=await SharedPreferences.getInstance();
    name=prefs.getString('name')!;
    email=prefs.getString('email')!;
  }
}