import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fourthpro/admin/students_list.dart';
import 'package:fourthpro/app_main_page.dart';
import 'package:fourthpro/admin/call_requests.dart';

import 'courses.dart';

class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppMainPage()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CallRequests()));
                },
                child: Container(
                  color: Colors.black12,
                  height: 70,
                  child: Row(
                    children: [
                      Text(
                        "   Call Requests",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.call,
                        size: 33,
                      ),
                      Text(" "),
                    ],
                  ),
                ),
              ),
            ),

            methode1(context, "   Employees", Icons.details,
                Image.asset("images/het-online-leren-4258917.webp")),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentsList()));
                },
                child: methode1(context, "   Students", Icons.people_outline,
                    Image.asset("images/het-online-leren-4258917.webp"))),



            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Courses()));
                },
                child: Container(
                  color: Colors.black12,
                  height: 70,
                  child: Row(
                    children: [
                      Text(
                        "   Courses",
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(
                        Icons.book,
                        size: 33,
                      ),
                      Text(" "),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )));
  }

  Column methode1(
      BuildContext context, String item, IconData iconData, Image image) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.black12,
            height: 70,
            child: Row(
              children: [
                Text(
                  item,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  iconData,
                  size: 33,
                ),
                Text(" "),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
