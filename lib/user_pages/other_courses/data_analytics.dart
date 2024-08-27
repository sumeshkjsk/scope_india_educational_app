import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import '../prgrm_course_pages/course_register_button.dart';

class DataAnalytics extends StatelessWidget {
  const DataAnalytics({super.key});

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

            Text("Data Analytics",
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
                                  " MySQL",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Python 3.10",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Data Processing using Pandas",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Numpy",
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
                                  " Matplotlib",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Data Processing using pandas",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Data Distribution",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " OJT",
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
