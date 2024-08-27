import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admin/admin_home_page.dart';
import '../theme/color_theme.dart';
import '../user_pages/profile_page.dart';
import 'otp_verify_page.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _passwordctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _emailctrl = TextEditingController();


  String emailid =" ";
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      emailid = prefs.getString("email")!;
      print("email : $emailid");
      await _getUserData();
      setState(() {
        isLoading = false;
      });
    }();

    super.initState();
  }
  Map<String,dynamic> user = {};
  Future<void> _getUserData()async{
   var snapshot = await FirebaseFirestore.instance.collection('USERS').doc(emailid).get();
   user = snapshot.data()!;
   print("User Details : $user");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.brown[50],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(backgroundColor: Colors.brown[50],
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: AppColor.blackColor),
            expandedHeight: 70,
            centerTitle: true,
            title: GestureDetector(
              onDoubleTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
              },
              child: Image(
                image: const AssetImage("images/scope-india-logo-bird.png"),
                height: 70,
                color: Colors.blue[900],),
            ),
            pinned: true,
          ),

          SliverToBoxAdapter(
            child: Form(
              key: _formkey,
              child: Column(
                children: [

                  Container(
                      color: AppColor.backgroundColor,
                      child: const Image(
                        image: AssetImage("images/scope-india-logo-web.png"),)),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [

                        const SizedBox(height: 10,),

                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: Text(emailid),
                              enabled: false,
                            )
                        ),


                        const SizedBox(height: 10,),

                      TextFormField(
                        controller: _passwordctrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Create Your Password"
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please ente password';
                          }
                          return null;
                        },
                      ),

                        const SizedBox(height: 10,),

                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Confirm Your Password"
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            if (value != _passwordctrl.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10,),

                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(onPressed: (){
                          _register();

                        },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.backgroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7),
                                )
                            ),
                            child: const Text("Confirm",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: AppColor.whiteColor,
                              ),)),
                      ),


                        const SizedBox(height: 20,),

                        // ElevatedButton(onPressed: (){
                        //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(details: user)));
                        // },
                        //     child: Text("Profile")),


                        Center(
                          child: isLoading ? CircularProgressIndicator():Column(
                            children: [

                              Row(
                                children: [
                                  Text("First Name",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColor.greyColor
                                    ),),
                                ],
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    label: Text("${user["First Name"]}"),
                                    enabled: false
                                ),
                              ),
                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text("Last Name",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColor.greyColor
                                    ),),
                                ],
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Text("${user["Last Name"]}"),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text("Email ID",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColor.greyColor
                                    ),),
                                ],
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Text("${user["Email ID"]}"),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Text("Phone Number",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColor.greyColor
                                    ),),
                                ],
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  label: Text("${user["Phone Number"]}"),
                                  enabled: false,
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          )
                        )



                      ],
                    ),
                  ),
                ],
              ),
            ),),
        ],),
    );
  }

  Future<void> _register() async {
    if (_formkey.currentState!.validate()) {
      try {
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailid,
          password: _passwordctrl.text,
        );

        //Email verification link
        await userCredential.user!.sendEmailVerification();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerifyPage(email: _emailctrl.text),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

}




// Text("${snapshot.data!["First Name"]}"),
// Text("${snapshot.data!["Last Name"]}"),
// Text("${snapshot.data!["Email ID"]}"),
// Text("${snapshot.data!["Phone Number"]}"),
// Text("${snapshot.data!["Date of Birth"]}"),
// Text("${snapshot.data!["Gender"]}"),
// Text("${snapshot.data!["Contry"]}"),
// Text("${snapshot.data!["State"]}"),
// Text("${snapshot.data!["City"]}"),
// Text("${snapshot.data!["Hobbies"]}"),



// Center(
//   child: FutureBuilder<DocumentSnapshot>(
//     future: FirebaseFirestore.instance.collection('USERS').doc("Amn An").get(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       }
//
//       if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       }
//
//       if (!snapshot.hasData || !snapshot.data!.exists) {
//         return Text('No data found');
//       }
//
//       // Assuming 'imageUrl' is the field in Firestore containing the image URL or base64 string
//       String imageUrl = snapshot.data?['Profile Pic'];
//
//       // Display the image using the URL or base64 string
//       return imageUrl.startsWith('http')
//           ? Image.network(imageUrl) // If URL, use Image.network
//           : Image.memory(
//         // If base64 string, decode and use Image.memory
//         base64Decode(imageUrl),
//         fit: BoxFit.cover,
//       );
//     },
//   ),
// ),