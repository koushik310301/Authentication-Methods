import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PhoneSignInScreen extends StatefulWidget {
  static const String id ="PhoneSignInScreen";
  @override
  _PhoneSignInScreenState createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phone,otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Sign Up"),

      ),
      body: Column(
        children: [
          SizedBox(height: 25),
          Center(
            child: TextField(
              onChanged: (value){
                phone=value;
              },
              decoration: (
                  InputDecoration(
                    hintText:"Enter Your Phone No. : ",
                  )
              ),
            ),
          ),
          SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              child: Text("Send OTP"),
              onPressed:()async{
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber:phone,
                  verificationCompleted: (PhoneAuthCredential credential)async {
                    await auth.verifyPhoneNumber(
                      phoneNumber:phone,
                      verificationCompleted: (PhoneAuthCredential credential) async {
                        // ANDROID ONLY!

                      },
                    );
                  },
                );
                print("OTP is sent");
              },
            ),
          ),
          SizedBox(height: 25),
          TextField(
            onChanged: (value){
              otp=value;
            },
            decoration: (
                InputDecoration(
                  hintText:"Enter Received OTP : ",
                )
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            child: Text("Verify OTP"),
            onPressed:()async {
              codeSent: (String verificationId, int resendToken) async {
                // Update the UI - wait for the user to enter the SMS code
                // Create a PhoneAuthCredential with the code
                PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
              };
            },
          ),
        ],
      ),
    );
  }
}
