import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';

class CourseDetailsPage extends StatelessWidget {
  final String courseName;
  final String courseImage;
  final String courseDetails;

  const CourseDetailsPage({
    Key? key,
    required this.courseName,
    required this.courseImage,
    required this.courseDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Text(courseName,
        style: TextStyle(color: AppColor.whiteColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Image.network(courseImage),
            SizedBox(height: 16.0),
            Text(courseDetails,
            style: TextStyle(
              color: AppColor.whiteColor,fontSize: 22, fontWeight: FontWeight.w500
            ),)

          ],
        ),
      ),
    );
  }
}
