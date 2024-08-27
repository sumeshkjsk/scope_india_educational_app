import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import '../prgrm_course_pages/course_register_button.dart';

class AdvancedTest extends StatelessWidget {
  const AdvancedTest({super.key});

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

            Text("Software Testing Advanced Internship",
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 22,fontWeight: FontWeight.w600,
              ),),

            Container(height: 5,color: AppColor.greyColor,),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: AppColor.greyColor,
                    child: Row(
                      children: [
                        Container(width: 9,),
                        Container(
                          width: MediaQuery.of(context).size.width*.45,
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Software testing fundamentals based on ISTQB",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " ISTQB Exam Preparation",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " SQL",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Java/Python",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " SEO Basics",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Selenium (IDE+WEBDRIVER)",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Live Projects with Suffix E Solutions",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Interview Preparation",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),

                        Container(
                          color: AppColor.blackColor,
                          width: 5,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width*.45,
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Selenium - testNG/pytest & Cucumber/Behave",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Maven integration with selenium and POM",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  "Version Control Tool GITHUB",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Appium Testing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Postman API",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " JMeter & Loadrunner",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Placement Support",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                      width: double.maxFinite,
                      child: CourseRegisterbutton()),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
