import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../drawerr.dart';
import '../../theme/color_theme.dart';
import '../prgrm_course_pages/course_register_button.dart';

class RedHatE extends StatelessWidget {
  const RedHatE({super.key});

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

            Text("Red Hat Engineer (RHCE) ",
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
                                  " Introduction of Ansible and automation",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Setup of Red Hat Ansible Engine",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Control node and managed node configuration setup",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Configure Ansible to manage hosts and run Adhoc Ansible commands",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Implementation of playbooks using YAML language",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Playbook writing concepts on multiple managed hosts",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Manage variables and facts concepts",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Write playbooks using variables",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Managing secrets - variables from an external file",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Ansible vault for encryption",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Managing facts and playbook writings using facts",
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
                                  " Custom facts, debug",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Play book writing using Magic variables",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  "Implement task control - loops",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),


                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Playbook writing using conditions and handlers",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Blocks, and manage ansible file, fetch, Jinja2 template",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),

                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Manage large projects",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Simplify playbooks with roles",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Reuse of Ansible code",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),


                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Troubleshoot playbooks and managed hosts",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Control and troubleshoot the Red Hat Enterprise Linux boot process",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Linux firewall",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Configure and manage MariaDB databases",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Apache-HTTPD web service",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),

                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width*.45,
                                color: AppColor.whiteColor,
                                child: Text(
                                  " Container concepts and deploying containers",
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
