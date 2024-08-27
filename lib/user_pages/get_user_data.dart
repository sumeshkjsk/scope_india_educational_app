import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late User? _user;
  late Future<DocumentSnapshot<Map<String, dynamic>>> _userDetailsFuture;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      _userDetailsFuture = getUserDetails(_user!.uid);
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails(String userId) async {
    return FirebaseFirestore.instance.collection('USERS').doc(userId).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile page'),
      ),
      body: _user != null
          ? FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: _userDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Text('User details not found');
          }
          var userData = snapshot.data!.data();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username: ${userData!['Email ID']}'),
              Text('Email: ${userData['First Name']}'),
              // Display other user details as needed
            ],
          );
        },
      )
          : Center(
        child: Text('User not authenticated'),
      ),
    );
  }
}
