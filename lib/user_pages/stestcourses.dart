import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/testing_courses/advanced_testing.dart';

import '../drawerr.dart';
import '../theme/color_theme.dart';

class STestCourses extends StatelessWidget {
  const STestCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      endDrawer: const DrawerBar(userId: '',),

      appBar: AppBar(toolbarHeight: 100,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor:AppColor.backgroundColor,
        title:  Image(image: AssetImage("images/scope-india-logo-web.png"),
          // color: Colors.blue[900],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 5,color: AppColor.greyColor,),
            Text("Software Testing Courses",
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 22,fontWeight: FontWeight.w600,
              ),),
            Container(height: 5,color: AppColor.greyColor,),
            Image(image: AssetImage("images/img_1-removebg-preview.png")),

            Padding(padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdvancedTest()));
                        },
                        child: Text("Software Testing Advanced",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),

                ],
              ),),


          ],
        ),
      ),
    );
  }
}
