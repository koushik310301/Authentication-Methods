import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OtpScreen extends StatefulWidget {
  static const String id='OtpScreen';
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Enter and Verify OTP"),
      ),
      body: Center(
        child: Column(
          children: [
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
