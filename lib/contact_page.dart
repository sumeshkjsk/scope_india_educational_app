

import 'package:flutter/material.dart';
import 'package:fourthpro/drawerr.dart';
import 'package:fourthpro/theme/color_theme.dart';


class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {

    var MedQuery=MediaQuery.of(context);

    return Scaffold(backgroundColor: AppColor.backgroundColor,

      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor:AppColor.backgroundColor,
        title:  Image(image: AssetImage("images/scope-india-logo-web.png"),
          // color: Colors.blue[900],
        ),

        ),

      body: SingleChildScrollView(
        child: Container(
          width: MedQuery.size.width*0.999,
          // color: Colors.blue[900],

          child: Column(
            children: [

              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: Text("Technopark TVM, Kerala",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: AppColor.whiteColor),

                    Container(
                      width: MedQuery.size.width * 0.9,
                      // height: MedQuery.size.height * 0.03,
                      // color: Colors.black,

                      child: Text(
                        "Phase 1, Main Gate, Diamond Arcade, Near Technopark, Trivandrum",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ),
                    )

                  ],
                ),
              ),



              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColor.whiteColor),
                    Text(" 9745936073",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.mail,color: AppColor.whiteColor,),
                    Text(" technopark@scopeindia.org",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Padding(padding: EdgeInsets.only(top: 10,)),

              Container(
                width: double.infinity,
                child: Text("Ernakulam, Kerala",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: AppColor.whiteColor,),

                    Container(
                      width: MedQuery.size.width * 0.9,
                      // height: MedQuery.size.height * 0.03,
                      // color: Colors.black,

                      child: Text(
                        " SCOPE INDIA, Vasanth Nagar Rd, near JLN Metro Station, Kaloor, Kerala 682025",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ),
                    )

                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColor.whiteColor,),
                    Text(" 7592939481",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.mail,color: AppColor.whiteColor,),
                    Text(" kochi@scopeindia.org",
                      style: TextStyle(
                        color:AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),



              Padding(padding: EdgeInsets.only(top: 10,)),

              Container(
                width: double.infinity,
                child: Text("Thampanoor TVM, Kerala",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: AppColor.whiteColor,),

                    Container(
                      width: MedQuery.size.width * 0.9,
                      // height: MedQuery.size.height * 0.03,
                      // color: Colors.black,

                      child: Text(
                        " TC 25/1403/3, Athens Plaza, SS Kovil Road, Thampanoor, Kerala 695001",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ),
                    )

                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColor.whiteColor,),
                    Text(" 8075536185",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.mail,color: AppColor.whiteColor,),
                    Text(" info@scopeindia.org",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),



              Padding(padding: EdgeInsets.only(top: 10,)),

              Container(
                width: double.infinity,
                child: Text("Nagercoil, Tamil Nadu",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: AppColor.whiteColor,),

                    Container(
                      width: MedQuery.size.width * 0.9,
                      // height: MedQuery.size.height * 0.03,
                      // color: Colors.black,

                      child: Text(
                        "SCOPE INDIA, Near WCC College, Palace Road, Nagercoil, Tamil Nadu 629001",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ),
                    )

                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColor.whiteColor,),
                    Text(" 8075536185",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.mail,color: AppColor.whiteColor,),
                    Text(" ngl@scopeindia.org",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),





              Padding(padding: EdgeInsets.only(top: 10,)),

              Container(
                width: double.infinity,
                child: Text("Ernakulam, Kerala",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.location_on,color: AppColor.whiteColor,),

                    Container(
                      width: MedQuery.size.width * 0.9,
                      // height: MedQuery.size.height * 0.03,
                      // color: Colors.black,

                      child: Text(
                        " SCOPE INDIA, Vasanth Nagar Rd, near JLN Metro Station, Kaloor, Kerala 682025",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:FontWeight.w600,
                          color: AppColor.greyColor,
                        ),
                      ),
                    )

                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.call,color: AppColor.whiteColor,),
                    Text(" 7592939481",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),


              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.mail,color: AppColor.whiteColor,),
                    Text(" kochi@scopeindia.org",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  ],
                ),
              ),
              //



            ],
          ),
        ),
      ),

    );
  }
}
