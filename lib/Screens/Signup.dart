import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/Screens/PhoneSignInScreen.dart';
import 'Authentication.dart';
import 'Home.dart';
import 'GoogleSignIn.dart';
class Signup extends StatefulWidget {
  static const String id='Signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name,email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            TextField(
              onChanged: (value){
                name=value;
              },
              decoration: (
              InputDecoration(
                hintText:"Enter Your Name : ",
              )
              ),
            ),
            SizedBox(height: 25),
            TextField(
              onChanged: (value){
                email=value;
              },
              decoration: (
                  InputDecoration(
                    hintText:"Enter Your Email : ",
                  )
              ),
            ),
            SizedBox(height: 25),
            TextField(
              obscureText: true,
              onChanged: (value){
                password=value;
              },
              decoration: (
                  InputDecoration(
                    hintText:"Password",

                  )
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text("SignUp"),
             onPressed:()async{
                bool shootNav = await signUp(email,password);
                if(shootNav){
                  Navigator.pushNamed(context, Home.id);
                }
               print("Signed Up");

             },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text("Google SignIn"),
              onPressed:()async {
                dynamic result=await signInWithGoogle();
                if(result!=null){
                  Navigator.pushNamed(context,Home.id);
                }
                print("Google Sign In Success");
                print(result.toString());
              },
            ),
            SizedBox(height: 25),
            ElevatedButton(
              child: Text("SignUp with Phone No."),
              onPressed:(){

                print("Signed Up with Phone No.");
                Navigator.pushNamed(context,PhoneSignInScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
