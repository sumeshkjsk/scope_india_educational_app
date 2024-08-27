import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../drawerr.dart';
import '../theme/color_theme.dart';

class ProfilePage extends StatefulWidget {
  String userId; // Assuming you have a userId to fetch the data

  ProfilePage({required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? userDetails; // To store user details
  bool isLoading = true; // To handle loading state

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      // Fetch user details from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('USERS')
          .doc(widget.userId) // Use the userId to fetch the user's document
          .get();

      if (userDoc.exists) {
        setState(() {
          userDetails = userDoc.data() as Map<String, dynamic>;
          isLoading = false; // Update the loading state
        });
      } else {
        // Handle case where document does not exist
        setState(() {
          isLoading = false;
        });
        print("No user found with the given userId.");
      }
    } catch (e) {
      // Handle errors
      setState(() {
        isLoading = false;
      });
      print("Error fetching user details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      endDrawer: const DrawerBar(userId: '',),

      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        backgroundColor: AppColor.backgroundColor,
        title: Image.asset(
          "images/scope-india-logo-web.png",
        ),
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColor.whiteColor,
                    radius: 50,
                    backgroundImage: NetworkImage(userDetails?["Profile Pic"])
                  ),
                  SizedBox(width: 10),
                  Text(
                    userDetails?['First Name'] ?? "USER NAME",
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildDetailField("First Name", userDetails?['First Name']),
              SizedBox(height: 10),
              _buildDetailField("Last Name", userDetails?['Last Name']),
              SizedBox(height: 10),
              _buildDetailField("Email ID", userDetails?['Email ID']),
              SizedBox(height: 10),
              _buildDetailField("Phone Number", userDetails?['Phone Number']),
              SizedBox(height: 10),
              _buildDetailField("Gender", userDetails?['Gender']),
              SizedBox(height: 10),
              _buildDetailField("Date of Birth", userDetails?['Date of Birth']),
              SizedBox(height: 10),
              _buildDetailField("Country", userDetails?['Country']),
              SizedBox(height: 10),
              _buildDetailField("State", userDetails?['State']),
              SizedBox(height: 10),
              _buildDetailField("City", userDetails?['City']),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build detail fields
  Widget _buildDetailField(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 22,
            color: AppColor.greyColor,
          ),
        ),
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: value,
          ),
        ),
      ],
    );
  }
}
