import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';


class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {


  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
          backgroundColor: AppColor.greyColor,
          icon: const Column(
            children: [
              Image(height: 70,
                image: AssetImage("images/scope-india-logo-bird.png"),color: AppColor.backgroundColor,),
            ],
          ),

          title: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("GET A FREE CALL BACK",
                style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Your Name"
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 5,),

                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter Your Phone No."
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }else if(value.length <=10) {
                      return 'Please enter valid phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 5,),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseFirestore.instance
                            .collection("Call Requests")
                            .add({
                          "Name": _nameController.text,
                          "Phone Number": _phoneController.text,
                        });

                        _nameController.clear();
                        _phoneController.clear();

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Success"),
                              content: Text("Your request has been submitted."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.greenColor,
                  ),
                  child: Text(
                    "    Call Me    ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                  ),
                ),

                SizedBox(height: 10,),
                Text("OR"),
                SizedBox(height: 10,),

                ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.greenColor,
                    ),
                    child: Text("   Call Now   ",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColor.whiteColor),)),

              ],
            ),
          ),
    );
  }
}