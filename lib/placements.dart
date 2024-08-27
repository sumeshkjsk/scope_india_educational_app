import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';

class Placements extends StatelessWidget {
  const Placements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        toolbarHeight: 100,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor:AppColor.backgroundColor,
        title:  Image(image: AssetImage("images/scope-india-logo-web.png"),
          // color: Colors.blue[900],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(image: AssetImage("images/screencapture-scopeindia-org-scope-india-placement-cell-2024-06-10-10_57_55.png")),

            Image(image: AssetImage("images/screencapture-scopeindia-org-scope-india-placement-cell-2024-06-10-10_57_55-2.png")),

            Image(image: AssetImage("images/screencapture-scopeindia-org-scope-india-placement-cell-2024-06-10-10_57_55-3.png")),

            Image(image: AssetImage("images/screencapture-scopeindia-org-scope-india-placement-cell-2024-06-10-10_57_55-4.png")),

          ],
        ),
      ),
    );
  }
}
