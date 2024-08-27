import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/main_home_page/sign_up_page.dart';
import 'package:fourthpro/theme/color_theme.dart';
import 'package:gap/gap.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({super.key});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Image(
            image: const AssetImage("images/scope-india-logo-bird.png"),
            height: 70,
            color: AppColor.whiteColor),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("USERS").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;

                  String dob = data["Date of Birth"] ?? "";
                  print(dob);
                  // DateTime today = DateTime.now();
                  //   dob.year;
                  // int age = today.year - dob.year;
                  //
                  // if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
                  //   age--;
                  // }

                  // Assuming 'imageUrl' is the field in Firestore containing the image URL or base64 string
                  String imageUrl = data['Profile Pic'] ?? "";

                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 7,
                        color: AppColor.greyColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        textColor: AppColor.whiteColor,
                        tileColor: AppColor.backgroundColor,
                        title: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${data["First Name"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Gap(15),
                                Text(
                                  "${data["Last Name"]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Email"),
                                ),
                                Text("${data["Email ID"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Contact Number"),
                                ),
                                Text("${data["Phone Number"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Registered Date"),
                                ),
                                Text("${data["Registered Date"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Gender"),
                                ),
                                Text("${data["Gender"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Date of Birth"),
                                ),
                                Text("${data["Date of Birth"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Contry"),
                                ),
                                Text("${data["Contry"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("State"),
                                ),
                                Text("${data["State"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("City"),
                                ),
                                Text("${data["City"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("Hobbies"),
                                ),
                                Text("${data["Hobbies"]}"),
                              ],
                            ),
                            Gap(10),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Text("User ID"),
                                ),
                                Text("${data["userId"]}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        shape: CircleBorder(),
        backgroundColor: AppColor.greyColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
