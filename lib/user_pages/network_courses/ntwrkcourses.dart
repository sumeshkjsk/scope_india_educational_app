import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/network_courses/aws_arc.dart';
import 'package:fourthpro/user_pages/network_courses/azure_cloud.dart';
import 'package:fourthpro/user_pages/network_courses/cisco.dart';
import 'package:fourthpro/user_pages/network_courses/dev_ops.dart';
import 'package:fourthpro/user_pages/network_courses/redhat.dart';
import 'package:fourthpro/user_pages/network_courses/redhat_e.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import 'ntwrk_srvr_cloud.dart';

class NtwrkCourses extends StatelessWidget {
  const NtwrkCourses({super.key});

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
            Text("Networking, Server, & Cloud",
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NetworkServerCloud()));
                        },
                        child: Text("Networking, Server, & Cloud",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),
                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AWSArc()));
                        },
                        child: Text("AWS Architect Solutions",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),
                  ),
                  Container(width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AzureCloud()));
                        },
                        child: Text("Ms Azure Cloud Administrator",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),),
                  Container(width: double.maxFinite,
                    child:  ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RedHat()));
                        },
                        child: Text("Red Hat Administrator (RHCSA)",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),),
                  Container(width: double.maxFinite,
                    child:  ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RedHatE()));
                        },
                        child: Text("Red Hat Engineer (RHCE) ",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ),),

                  Container(width: double.maxFinite,
                      child:  ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DevOps()));
                          },
                          child: Text("DevOps Internship",
                            style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: 22,
                            ),)
                      )),
                  Container(width: double.maxFinite,
                    child:  ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cisco()));
                        },
                        child: Text("Cisco Network - CCNA 200-301",
                          style: TextStyle(
                            color: AppColor.blackColor,
                            fontSize: 22,
                          ),)
                    ), ),


                ],
              ),),


          ],
        ),
      ),
    );
  }
}
