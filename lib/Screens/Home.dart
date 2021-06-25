import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/Screens/Signup.dart';
class Home extends StatefulWidget {
  static const String id='Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home Screen"),
        centerTitle: true,

      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Center(
            child: Text(
              currentUser.email,
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: Text(
              currentUser.uid,
            ),

          ),
          SizedBox(height: 25),
          ElevatedButton(
            child: Text("Logout"),
            onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              print("Logout");
              Navigator.pushNamed(context, Signup.id);
            },
          ),

        ],
      ),
    );
  }
}
