import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fourthpro/main_home_page/sign_up_page.dart';

class AdsLogin extends StatefulWidget {
  const AdsLogin({super.key});

  @override
  State<AdsLogin> createState() => _AdsLoginState();
}

class _AdsLoginState extends State<AdsLogin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Swiper(

        autoplay: true,
        itemWidth: 500,
        itemHeight: 270,
        loop: true,
        duration: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You have to register first")));

            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagepath[index]),
                    fit: BoxFit.cover ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }, itemCount: imagepath.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}

List imagepath= [
  'images/scope-india-aws-certification-course-(1).jpeg',
  "images/scope-india-digital-marketing-course.jpeg",
  "images/scope-india-dotnet-core-full-stack-course.jpeg",
  "images/scope-india-flutter-fullstack-course.jpeg",
  "images/scope-india-full-stack-intermediate-offer-sep2022-2 (1).jpeg",
  "images/scope-india-java-full-stack-course (1).jpeg",
  "images/scope-india-mean-mern-stack-course.jpeg",
  "images/scope-india-network-server-administration-course (1).jpeg",
  "images/scope-india-php-full-stack-course (1).jpeg",
  "images/scope-india-python-full-stack-course (1).jpeg",
  "images/scope-india-software-testing-manual-automation-course.jpeg",
  "images/Devops-training-scopeindia.jpeg",
];

