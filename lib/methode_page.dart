

import 'package:flutter/material.dart';

void main(){
  runApp( MaterialApp(home: CourseSelectionPage()));
}

class CourseSelectionPage extends StatefulWidget {
  const CourseSelectionPage({super.key});

  @override
  State<CourseSelectionPage> createState() => _CourseSelectionPageState();
}

class _CourseSelectionPageState extends State<CourseSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("images/scope-india-logo-bird.png",scale: 2,color: Colors.blue[900],),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            details(context,"sumesh",Icons.male),
            details(context,"monis",Icons.male),
            details(context,"kesiya",Icons.female),
            details(context,"safvan",Icons.male),
          ],
        ),
      ),
    );
  }

  Padding details(BuildContext context, String name, IconData ikon) {
    return Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Client details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Image.asset("images/img_1-removebg-preview.png",width: 70,height: 70,)],),
                Divider(),
                Icon(ikon),
                Text("Name: $name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                Text("Age: 20",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                Text("Place: malappuram",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                Text("Course: flutter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              ],),
            ),
          );
  }
}
