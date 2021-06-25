import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:loginsignup/Screens/Home.dart';
import 'package:loginsignup/Screens/Login.dart';
import 'package:loginsignup/Screens/PhoneSignInScreen.dart';
import 'package:loginsignup/Screens/Signup.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Signup.id,
      routes: {
        Home.id:(context)=>Home(),
        Signup.id:(context)=>Signup(),
        Login.id:(context)=>Login(),
        PhoneSignInScreen.id:(context)=>PhoneSignInScreen(),
      },

    );
  }
}

