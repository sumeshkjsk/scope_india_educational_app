import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fourthpro/app_main_page.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:fourthpro/user_pages/main_screen_page.dart';

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
   void initState() {
     super.initState();
     Timer(
       Duration(seconds: 2), // Change duration as needed
           () =>
               Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) =>
         // MainScreen()
         AppMainPage()
         ), // Navigate to main app
       ),
     );

     // if(SharedPreferences==null){
     //   Navigator.pushReplacement(
     //     context,
     //     MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigate to main app
     //   );
     // }else{
     //   Navigator.pushReplacement(
     //     context,
     //     MaterialPageRoute(builder: (context) => const SignUpPage()), // Navigate to main app
     //   );
     // }
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/scope-india-logo-bird.png',color: AppColor.backgroundColor,), // Replace with your splash screen image path
      ),
    );
  }
}
