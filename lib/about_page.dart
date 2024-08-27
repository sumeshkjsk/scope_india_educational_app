
import 'package:flutter/material.dart';
import 'package:fourthpro/drawerr.dart';
import 'package:fourthpro/theme/color_theme.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,

      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor:AppColor.backgroundColor,
        title:  Image(image: AssetImage("images/scope-india-logo-web.png"),
          // color: Colors.blue[900],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              const Text("Your Career Partner",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.whiteColor,
                ),),

              const Text("One of the best Training Destination for Software, Networking and Cloud Computing courses in India with 17 years of Industrial experience,Software, Networking, and Cloud Professional Education Centre in Kerala from Suffix E Solutions with WORKING PROFESSIONALS oriented on-the-job TRAINING model.",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.greyColor,
                ),),

              const Text("SCOPE INDIA provides courses for Software Programming in Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics), Java, PHP, .Net, Software Testing Manual and Automation, Cloud Computing (AWS | Azure), Server Administration (MCSE | RHCE), Networking (CCNA), Mobile App Development in Flutter, and Digital Marketing. Training with 100% Trusted Job Based Internship Model.",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.greenColor,
                ),
              ),


              const Text("SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students every year. We assure you, you won't regret it after training from SCOPE INDIA!",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.greyColor,
                ),
              ),

              const Text("This is how SCOPE INDIA can support both newbies and experienced in the industry to upgrade their skills",
                style: TextStyle(
                  fontSize: 17,
                  color: AppColor.greyColor,
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }
}
