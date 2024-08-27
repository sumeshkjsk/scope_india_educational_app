import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/swiper_page.dart';

class StackAds extends StatefulWidget {
  const StackAds({super.key});

  @override
  State<StackAds> createState() => _StackAdsState();
}

class _StackAdsState extends State<StackAds> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left:7,right: 7),
    child: Stack(
    children: [
    Container(
    height: 550,alignment: Alignment.centerRight,
    width: MediaQuery.of(context).size.width *1,
    // color: Colors.pink,
    child:  const Image(image: AssetImage("images/i.webp"),),
    ),
    const SwiperScreen(),
    // Text("The World is Waiting for You",
    // style: TextStyle(
    // fontWeight: FontWeight.w900,
    // fontSize: 18,
    // color: Colors.blue[900]
    // ),
    // ),
      ],),
    );
  }
}
