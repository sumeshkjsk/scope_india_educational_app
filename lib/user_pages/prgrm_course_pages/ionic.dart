import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import 'course_register_button.dart';

class IONIC extends StatelessWidget {
  const IONIC({super.key});

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

            Text("IONIC - Android - iOS Mobile App ",
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
                                  " Angular",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Native API",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " HTML 6",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " GIT Version Control",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Cordova/Capacitor",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  "REST Services",
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
                                  " Typescript",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " JQuery",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " CSS 4",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " App Deployment Tools",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  "Web Hosting Technique",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " JavaScript ES 7",
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
