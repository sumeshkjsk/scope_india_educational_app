import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import '../prgrm_course_pages/course_register_button.dart';

class DigitalMarketing extends StatelessWidget {
  const DigitalMarketing({super.key});

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

            Text("Digital Marketing",
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
                                  " HTML 6 Basics",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Digital Marketing Overview",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Advanced Keyword Research",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Website Planning and Structuring",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " WordPress Website Designing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " SEO Audits - Google Analytics",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " SEO Audits - Google Search Console",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " SEO Audits - Google Tag Manager",
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
                                  " Search Engine Marketing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Social Media Marketing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Google Search Advertising",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Affiliate Marketing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Content Marketing",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Mobile SEO Techniques",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Advanced SEO - On page | Technical | Off page",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " E-Co. SEO",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " BlackHat SEO",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Advanced SEO",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Live Deployment",
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
