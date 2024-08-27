import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/other_courses/data_analytics.dart';
import 'package:fourthpro/user_pages/other_courses/data_science_ai.dart';
import 'package:fourthpro/user_pages/other_courses/digital_marketing.dart';
import 'package:fourthpro/user_pages/other_courses/microsoft_power_bi.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';

class OtherCourses extends StatelessWidget {
  const OtherCourses({super.key});

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
            Text("Other Courses",
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DataScienceAI()));
                        },
                        child: Text("Data Science & AI",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),
                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DataAnalytics()));
                        },
                        child: Text("Data Analytics",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),

                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DigitalMarketing()));
                        },
                        child: Text("Digital Marketing",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),
                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MicrosoftPowerBI()));
                        },
                        child: Text("Microsoft Power BI",
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
