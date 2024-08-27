import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:gap/gap.dart';

void main(){
  runApp(MaterialApp(home: CourseSelection(),
    theme: ThemeData(
      dialogTheme: DialogTheme(
        backgroundColor: AppColor.greyColor
      )
    ),
  ));
}

class CourseSelection extends StatefulWidget {
  const CourseSelection({super.key});

  @override
  State<CourseSelection> createState() => _CourseSelectionState();
}

class _CourseSelectionState extends State<CourseSelection> {

  List<String> items = [
    "Java Full Stack",
    "Python Full Stack",
    ".Net Core Full Stack",
    "MERN Full Stack",
    "MEAN Full Stack",
    "Google Flutter",
    "PHP Full Stack",
    "IONIC",
    "Website Designing",
    "UI/UX Designing",
    "Software Testing",
    "Data science & Ai",
    "Data Analytics",
    "Digital Marketing",
    "Microsoft Power BI",
    "Networking, Server, & Cloud",
    "AWS Architect Associate",
    "Ms Azure Cloud Administrator",
    "Red Hat Certified System Administrator",
    "Red Hat Certified Engineer",
    "DevOps Engineer",
    "Cisco Certified Network Associate",
  ];

  List<String> selectedItem = [];

  // late final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Container(
            color: AppColor.backgroundColor,
            child: const Image(height: 70,
              image: AssetImage("images/scope-india-logo-bird.png"),),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50,top: 20),
          child: Column(
            children: [
              const SizedBox(height: 3,),
              Text("Choose Your Course",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: AppColor.greenColor,
                ),),

              const Gap(10),

              ...items
                  .map((e) => CheckboxListTile(
                activeColor: AppColor.whiteColor,
                checkColor: AppColor.backgroundColor,
                value: selectedItem.contains(e),
                onChanged: (value) {
                  if (selectedItem.contains(e)) {
                    selectedItem.remove(e);
                  } else {
                    selectedItem.add(e);
                  }
                  setState(() {});
                },
                title: Text(e,style: const TextStyle(color: AppColor.whiteColor),),
                secondary: Container(
                  color: AppColor.greyColor,
                  width: 5,
                  height: 7,
                ),


              )),


              const Gap(20),

              GestureDetector(
                onTap: ()async{
                  if(selectedItem.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content:  Center(
                          child: Text("Please choose your Course",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.red
                          ),),
                        ),
                        backgroundColor: AppColor.greyColor,));
                  }else {
                    setState(() {
                       alert(context, title: const Text("Selected Course : "),

                        // content:
                        textOK: Column(
                          children: [
                            Container(
                              width: double.maxFinite,
                              // height: 300,
                              decoration: BoxDecoration( color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("$selectedItem,",
                                      style: const TextStyle(fontSize: 17,color: AppColor.backgroundColor),),
                                  ),
                                ],
                              ),
                            ),
                            Gap(5),
                            ElevatedButton(
                                onPressed: (){},
                                style: const ButtonStyle(
                                    backgroundColor: WidgetStateColor.transparent
                                ),
                                child: const Text("OK",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: AppColor.whiteColor
                                  ),
                                )),
                          ],
                        ),);
                    });

                  } },
                child: const Center(
                  child: Text("C o n f i r m",
                    style: TextStyle(
                        fontSize: 25,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w600
                    ),),
                ),
              ),

              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
