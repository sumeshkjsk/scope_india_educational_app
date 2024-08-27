import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/dtailes.dart';

import '../drawerr.dart';
import '../scop_ads.dart';
import '../theme/color_theme.dart';

class HomeScreen extends StatefulWidget {
  final String userEmail;
   HomeScreen({super.key, required this.userEmail});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late String email;

  @override
  void initState() {
    super.initState();
    email = widget.userEmail; // Initialize email from widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      endDrawer:  DrawerBar(userId: email,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            pinned: true,
            iconTheme: IconThemeData(color: AppColor.blackColor),
            expandedHeight: 70,
            centerTitle: true,
            title: Image(
              image: AssetImage("images/scope-india-logo-bird.png"),
              height: 70,color: Colors.blue[900],),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
              Container(
                color: AppColor.backgroundColor,
                  child: Image(image: AssetImage("images/scope-india-logo-web.png"),)),


                const Details(),
                const StackAds(),

                      // Container(
                      //   height: 300,
                      //   width: MediaQuery.of(context).size.width *.40,
                      //   child: Stack(
                      //     children: [
                      //       Image(image: AssetImage("images/toshiba-satellite-c660-1p9.jpeg"),),
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 60,left: 10),
                      //         child: Transform.rotate(
                      //           angle: -math.pi / 22,
                      //           child: Text("COURSES",
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w900,
                      //           fontSize: 17,
                      //           color: Colors.green,
                      //         ),),),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 80,left: 10),
                      //         child: Transform.rotate(
                      //           angle: -math.pi / 19,
                      //         child: Text("⇢⇢⇢⇢⇢",
                      //         style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
                      //       ),),
                      //
                      //     ],
                      //   ),
                      // )


              ],
            ),
          )
        ],
      ),

    );
  }
}





// appBar: AppBar(
// centerTitle: false,
// title: Text("Name"),
// actions: [
// Container(padding: EdgeInsets.only(left: 10,right: 10),
// child: Row(
// children: [
// Container(height: 70,width: 60,
// decoration: BoxDecoration(
// color: Colors.indigo,
// borderRadius: BorderRadius.circular(50),
// ),
// ),
// SizedBox(width: 10,),
// Icon(Icons.menu),
// ],
// ),
// ),
// ],
// ),
