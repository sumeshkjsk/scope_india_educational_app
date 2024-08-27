import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../theme/color_theme.dart';
import 'course_details.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseDetailsController = TextEditingController();
  bool isLoading = false;

  Future<void> getImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> uploadCourse() async {
    setState(() {
      isLoading = true;
    });

    try {
      if (selectedImage != null && courseNameController.text.isNotEmpty && courseDetailsController.text.isNotEmpty) {
        String addId = randomAlphaNumeric(10);
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child("CourseImage")
            .child(addId);
        UploadTask uploadTask = firebaseStorageRef.putFile(selectedImage!);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        Map<String, dynamic> placed = {
          "Name": courseNameController.text,
          "Details": courseDetailsController.text,
          "Image": downloadUrl,
        };

        await FirebaseFirestore.instance
            .collection("Courses")
            .doc(addId)
            .set(placed);

        setState(() {
          selectedImage = null;
          courseNameController.clear();
          courseDetailsController.clear();
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Course has been uploaded successfully...",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Error: $e",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _deleteCourse(String courseId) async {
    try {
      await FirebaseFirestore.instance.collection("Courses").doc(courseId).delete();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          "Course has been deleted successfully.",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Error: $e",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
    }
  }

  @override
  void dispose() {
    courseNameController.dispose();
    courseDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff071e67),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Courses",
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 10),
              child: Column(
                children: [
                  Container(
                    height: 700, // Adjust the height as needed
                    child: _buildCoursesList(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.whiteColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog.adaptive(
                backgroundColor: AppColor.greyColor,
                title: Column(
                  children: [
                    GestureDetector(
                      onTap: getImage,
                      child: Center(
                        child: Container(
                          height: 180,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(56, 255, 255, 255),
                            border: Border.all(color: AppColor.backgroundColor, width: 1.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: selectedImage == null
                              ? Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: AppColor.backgroundColor,
                          )
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField(courseNameController, "Course Name"),
                    SizedBox(height: 10),
                    _buildTextField(courseDetailsController, "Course Details"), // New field for course details
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.backgroundColor,
                        ),
                        onPressed: uploadCourse,
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffececf8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCoursesList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("Courses").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "No courses available.",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var courseDoc = snapshot.data!.docs[index];
            var course = courseDoc.data() as Map<String, dynamic>;
            var courseName = course['Name'] ?? 'Unnamed';
            var courseDetails = course['Details'] ?? 'No details available';
            var courseImage = course['Image'] ?? '';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseDetailsPage(
                            courseName: courseName,
                            courseImage: courseImage,
                            courseDetails: courseDetails,
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        courseImage,
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        courseName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Gap(50),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteCourse(courseDoc.id),
                      ),
                    ],
                  ),
                  Gap(50),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
