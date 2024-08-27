import 'package:flutter/material.dart';
import 'package:fourthpro/user_pages/profile_page.dart';
import '../about_page.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  final String userEmail; // Use final for immutable parameters

  const MainScreen({super.key, required this.userEmail});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String email;

  @override
  void initState() {
    super.initState();
    email = widget.userEmail; // Initialize email from widget
  }

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> mypages = [
      ProfilePage(userId: email), // Pass email directly
      HomeScreen(userEmail: email),
      About(),
    ];

    return Scaffold(
      body: mypages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
