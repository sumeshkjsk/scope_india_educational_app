
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:fourthpro/user_pages/course_dsgn.dart';

import 'drawerr.dart';

class SliderAds extends StatefulWidget {
  const SliderAds({super.key});

  @override
  State<SliderAds> createState() => _SliderAdsState();
}

class _SliderAdsState extends State<SliderAds> {

  final items = [
    GestureDetector(
      onTap: (){

      },
        child: Image.asset('images/scope-india-aws-certification-course-(1).jpeg')),
    Image.asset('images/scope-india-digital-marketing-course.jpeg'),
    Image.asset("images/scope-india-dotnet-core-full-stack-course.jpeg",),
    Image.asset("images/scope-india-flutter-fullstack-course.jpeg",),
    Image.asset("images/scope-india-full-stack-intermediate-offer-sep2022-2 (1).jpeg",),
    Image.asset("images/scope-india-java-full-stack-course (1).jpeg",),
    Image.asset("images/scope-india-mean-mern-stack-course.jpeg",),
    Image.asset("images/scope-india-network-server-administration-course (1).jpeg",),
    Image.asset("images/scope-india-php-full-stack-course (1).jpeg",),
    Image.asset("images/scope-india-python-full-stack-course (1).jpeg",),
    Image.asset("images/scope-india-software-testing-manual-automation-course.jpeg",),
    Image.asset("images/Devops-training-scopeindia.jpeg",),
  ];

  int currentIndex = 0;
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

            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 270,
                // aspectRatio: 1.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: items,
            ),
            DotsIndicator(
              dotsCount: items.length,
              position: currentIndex,
              decorator: DotsDecorator(
                activeColor: Colors.white,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            CourseDsgn(),
          ],
        ),
      ),
    );
  }
}