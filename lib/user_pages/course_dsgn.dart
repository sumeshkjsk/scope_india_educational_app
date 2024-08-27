import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:fourthpro/user_pages/network_courses/ntwrkcourses.dart';
import 'package:fourthpro/user_pages/other_courses/other_courses.dart';
import 'package:fourthpro/user_pages/prgrmcourses.dart';
import 'package:fourthpro/user_pages/stestcourses.dart';

class CourseDsgn extends StatefulWidget {
  const CourseDsgn({super.key});

  @override
  State<CourseDsgn> createState() => _CourseDsgnState();
}

class _CourseDsgnState extends State<CourseDsgn> {
  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(),
      // body:
      Padding(padding: EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
      alignment: Alignment.centerLeft,
      height: 44,
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PrgrmCourses()));
        },
        child: Text(" Software Programming Courses",
        style: TextStyle(
          fontSize: 22,
          color: AppColor.backgroundColor,
          fontWeight: FontWeight.w600
        ),),
      ),
        ),
        SizedBox(height: 5,),
        Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 44,
          width: MediaQuery.of(context).size.width*.8,
          decoration: BoxDecoration(
            color: AppColor.greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NtwrkCourses()));
            },
            child: Text(" Networking, Server, & Cloud",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColor.backgroundColor,
                  fontWeight: FontWeight.w600
              ),),
          ),
        ),
      ],
        ),

        SizedBox(height: 5,),
        Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 44,
          width: MediaQuery.of(context).size.width*.7,
          decoration: BoxDecoration(
            color: AppColor.greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>STestCourses()));
            },
            child: Text(" Software Testing Courses",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColor.backgroundColor,
                  fontWeight: FontWeight.w600
              ),),
          ),
        ),
      ],
        ),

        SizedBox(height: 5,),
        Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 44,
          width: MediaQuery.of(context).size.width*.6,
          decoration: BoxDecoration(
            color: AppColor.greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherCourses()));
            },
            child: Text(" Other Courses",
              style: TextStyle(
                  fontSize: 22,
                  color: AppColor.backgroundColor,
                  fontWeight: FontWeight.w600
              ),),
          ),
        ),
      ],
        ),

      ],
      ),

    );
  }
}
