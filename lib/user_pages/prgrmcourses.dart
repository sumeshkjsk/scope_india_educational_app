import 'package:flutter/material.dart';

import 'package:fourthpro/user_pages/prgrm_course_pages/dot_net_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/flutterr.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/ionic.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/java_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/mean_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/mern_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/php_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/python_full_stack.dart';
import 'package:fourthpro/user_pages/prgrm_course_pages/uiuxdesign.dart';
import '../drawerr.dart';
import '../theme/color_theme.dart';

class PrgrmCourses extends StatelessWidget {
  const PrgrmCourses({super.key});

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
            Text("Software Programming Courses",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JavaFullStack()));
                      },
                      child: Text("Java Full Stack Internship",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),
                ),
                Container(width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PythonFullStack()));
                      },
                      child: Text("Python Full Stack Internship",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),
                ),
                Container(width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PHPFullStack()));
                      },
                      child: Text("PHP Full Stack Internship",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),),
                Container(width: double.maxFinite,
                  child:  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DotNetFullStack()));
                      },
                      child: Text(".Net Core Full Stack Internship",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),),
                Container(width: double.maxFinite,
                  child:  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MernFullStack()));
                      },
                      child: Text("MERN Full Stack Internship",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),),

                Container(width: double.maxFinite,
                    child:  ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MeanFullStack()));
                        },
                        child: Text("MEAN Full Stack Internship",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    )),
                Container(width: double.maxFinite,
                  child:  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Flutterr()));
                      },
                      child: Text("Flutter - Android - iOS Mobile App",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ), ),
                Container(width: double.maxFinite,
                  child:  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IONIC()));
                      },
                      child: Text("IONIC - Android - iOS Mobile App ",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ), ),

                Container(width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UIUXDesign()));
                      },
                      child: Text("UI/UX Designing Training",
                        style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 22,
                        ),)
                  ),  ),


              ],
            ),),


          ],
        ),
      ),
    );
  }
}
