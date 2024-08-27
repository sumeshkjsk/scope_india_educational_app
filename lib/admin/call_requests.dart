import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/theme/color_theme.dart';

class CallRequests extends StatefulWidget {
  const CallRequests({super.key});

  @override
  State<CallRequests> createState() => _CallRequestsState();
}

class _CallRequestsState extends State<CallRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Call Requests",
        style: TextStyle(color: AppColor.whiteColor),),
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Call Requests").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No call requests available.",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var request = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              var name = request['Name'] ?? 'Unnamed';
              var phoneNumber = request['Phone Number'] ?? 'Unknown';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: AppColor.greyColor,
                child: ListTile(
                  leading: Icon(Icons.phone, color: AppColor.backgroundColor),
                  title: Text(
                    name,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    phoneNumber,
                    style: TextStyle(
                      color: AppColor.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection("Call Requests")
                            .doc(snapshot.data!.docs[index].id)
                            .delete();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Request deleted successfully"),
                          backgroundColor: Colors.green,
                        ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Failed to delete request: $e"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
