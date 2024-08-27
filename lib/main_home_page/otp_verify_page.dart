import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/main_screen_page.dart';

class OtpVerifyPage extends StatefulWidget {
  final String? email;
  OtpVerifyPage({super.key, required this.email});

  @override
  _OtpVerifyPageState createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final TextEditingController _otpController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> _verified() async {
    if (formkey.currentState!.validate()) {
      try {
        final userdoc = await FirebaseFirestore.instance
            .collection("USERS")
            .doc(widget.email)
            .get();
        if (userdoc.exists) {
          bool isUser = await _checkOTP(_otpController.text);

          if (isUser) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(userEmail: widget.email!),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Incorrect OTP")),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("User does not exist")),
          );
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  Future<bool> _checkOTP(String otp) async {
    const String userotp = "82930";
    return otp == userotp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.email ?? "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Text(
                'Check Your Email and click on the link to Verify',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "OR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                'Enter OTP and Verify',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _otpController,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the OTP';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verified,
                child: Text('Verified'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
