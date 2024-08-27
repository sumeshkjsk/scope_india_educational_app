import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fourthpro/slider_page.dart';


class SwiperScreen extends StatefulWidget {
  const SwiperScreen({super.key});

  @override
  State<SwiperScreen> createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 250,
          width: 240,
          child: Swiper(
            onTap: (int){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SliderAds(),));
            },
            autoplay: true,
            itemWidth: 240,
              itemHeight: 180,
              loop: true,
              duration: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(imagepath[index]),
                      fit: BoxFit.fill ),
                  borderRadius: BorderRadius.circular(20),
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