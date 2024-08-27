import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';

class CourseRegisterbutton extends StatelessWidget {
  const CourseRegisterbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
        child: Text("Register Now",
        style:TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColor.backgroundColor
        ),));
  }
}
