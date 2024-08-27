import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(MaterialApp(
    home: OtpSender(),
  ));
}

class OtpSender extends StatefulWidget {
  const OtpSender({super.key});

  @override
  State<OtpSender> createState() => _OtpSenderState();
}

class _OtpSenderState extends State<OtpSender> {
  final EmailController = TextEditingController();
  var otpnum = 0;

  Future<dynamic> inviteMail() async {
    String username = 'sumeshkjsk@gmail.com'; // Replace with your Gmail address
    String password = 'wbetxoupmjxsbdkms'; // Replace with your Gmail app password

    var rnd = Random();
    var next = rnd.nextDouble() * 10000;
    while (next < 1000) {
      next *= 10;
    }
    otpnum = next.toInt();
    print("OTP Num ${otpnum}");
    print("email:${EmailController.text}");
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, "Invitation")
      ..recipients.add(EmailController.text)
      ..subject = 'Invitation To Register In Attendance App'
      ..html =
          "<h1>$otpnum</h1>\n<p>Do not share your OTP to anyone.</p>\n<p><h2>You will be forwarded attendance app apk, Register using your email in the app to start using the app<h2></h2></p>";

    try {
      final sendLink = await send(message, smtpServer);
      print('Message sent: ' + sendLink.toString());
      Map<String, dynamic> value = {"otp": otpnum, "status": true};
      otpnum = 0;
      return value;
    } on MailerException catch (e) {
      print('Message not sent.');

      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      Map<String, dynamic> value = {"otp": 0, "status": false};
      otpnum = 0;
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Sender"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: EmailController,
            decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          ElevatedButton(
            onPressed: () {
              inviteMail();
            },
            child: Text("Send"),
          )
        ],
      ),
    );
  }
}
