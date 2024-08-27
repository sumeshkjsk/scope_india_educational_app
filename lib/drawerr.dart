import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:fourthpro/user_pages/profile_page.dart';

import 'about_page.dart';
import 'contact_page.dart';

class DrawerBar extends StatefulWidget {
  final String userId;
  const DrawerBar({super.key, required this.userId});

  @override
  State<DrawerBar> createState() => _DrawerBarState();
}

class _DrawerBarState extends State<DrawerBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("SCOPE INDIA", style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 23,
              fontWeight: FontWeight.w900,
            ),),
            accountEmail: Text("kochi@scopeindia.org",
              style: TextStyle(
                color: AppColor.whiteColor,
              ),
            ),
            currentAccountPicture: CircleAvatar(backgroundColor: AppColor.whiteColor,
              child: ClipOval(
                child: Image.asset("images/scope-india-logo-bird.png",color: AppColor.backgroundColor,),
              ),
            ),
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
            ),
          ),
          ListTile(tileColor: AppColor.backgroundColor,
            leading: Icon(Icons.home,color: AppColor.whiteColor,),
            title: Text("Home",
              style: TextStyle(
                color: AppColor.greyColor,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),),
            onTap: (){
            },
          ),


          Divider(height: 2,),

          ListTile(tileColor: AppColor.backgroundColor,
              leading: Icon(Icons.account_circle,color: AppColor.whiteColor,),
              title: Text("Profile",
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),),
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(userId: widget.userId,)));
              }
          ),

          Divider(height: 2,),

          ListTile(tileColor: AppColor.backgroundColor,
              leading: Icon(Icons.info_outline,color: AppColor.whiteColor,),
              title: Text("About us",
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> About()));
              }
          ),

          Divider(height: 2,),

          ListTile(tileColor: AppColor.backgroundColor,
            leading: Icon(Icons.call,color: AppColor.whiteColor,),
            title: Text("Contact",
              style: TextStyle(
                color: AppColor.greyColor,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Contact()));
            },
          ),

          Divider(height: 2,),

          ListTile(tileColor: AppColor.backgroundColor,
              leading: Icon(Icons.settings,color: AppColor.whiteColor,),
              title: Text("Settings",
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),),
              onTap: () {
              }
          ),


          Divider(height: 2,),

          ListTile(tileColor: AppColor.backgroundColor,
            leading: Icon(Icons.logout,color: AppColor.whiteColor,),
            title: Text("Log Out",
              style: TextStyle(
                color: AppColor.greyColor,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),),
            onTap: () => print("Log Out Tapped"),
          ),

        ],
      ),
    );
  }
}

