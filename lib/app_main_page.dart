import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:fourthpro/help_page.dart';
import 'package:fourthpro/main_home_page/sign_up_page.dart';
import 'package:fourthpro/scope_vdoad.dart';
import 'package:fourthpro/user_pages/dtailes.dart';
import 'package:fourthpro/user_pages/home_screen.dart';
import 'package:gap/gap.dart';
import '../admin/admin_home_page.dart';
import '../theme/color_theme.dart';


class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key,});

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {

  final _fireauth = FirebaseAuth.instance;
  final _emailctrl = TextEditingController();
  final _passwordctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();


  bool _isVisible = true; // This variable controls the visibility of the container

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible; // Toggle the visibility
    });
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

        var courses = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Swiper(viewportFraction: 0,
            autoplay: true,
            // autoplayDelay: 5000, // 5 seconds delay between transitions
            // autoplayDisableOnInteraction: true,
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: 270,
            loop: true,
            duration: 800, // Smoother transition animation (longer duration)
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var courseImage = courses[index]['Image'] ?? '';

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "You have to register first",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(courseImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
            itemCount: courses.length,
            layout: SwiperLayout.STACK,
          ),
        );
      },
    );
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
              onDoubleTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminHomePage()));
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [
                    Container(
                        color: AppColor.backgroundColor,
                        child: const Image(
                          image: AssetImage("images/scope-india-logo-web.png"),)),

                    Column(
                      children: [
                        Gap(10),
                        SizedBox(
                          height: 300, // Adjust the height as needed
                          child: _buildCoursesList(),
                        ),

                        const SizedBox(height: 10,),

                        const SizedBox(height: 10,),

                        TextFormField(
                          controller: _emailctrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              label: const Text("Email ID"),
                            ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email id';
                            }
                            // Regular expression for email validation
                            RegExp regExp = RegExp(
                              r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                              caseSensitive: false,
                              multiLine: false,
                            );
                            if (!regExp.hasMatch(value)) {
                              return 'Please enter registered email id';
                            }
                            return null; // Return null if the validation passes
                          },
                        ),


                        const SizedBox(height: 10,),

                        TextFormField(
                          controller: _passwordctrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              labelText: "Password"
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please enter password";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 10,),

                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: AppColor.backgroundColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              try{
                                if(_formkey.currentState!.validate()){
                                await _fireauth.signInWithEmailAndPassword(
                                    email: _emailctrl.text,
                                    password: _passwordctrl.text,
                                  );

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(userEmail: _emailctrl.text,)));
                                }
                              }catch(e){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error : $e"))
                                );
                              }

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.backgroundColor
                            ),
                            child: const Text("Login",
                              style: TextStyle(
                                color: AppColor.whiteColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),),
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                          },
                          child: const Row(mainAxisAlignment: MainAxisAlignment
                              .center,
                            children: [
                              Text("Don't have an Account,    "),
                              Text("Sign Up.",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),),
                            ],
                          ),
                        ),


                        const SizedBox(height: 20,),

                        TextButton(onPressed: (){
                          showDialog(context: context, builder: (_){ return const HelpPage();});
                        },
                            child:  Image.asset("images/call.webp"),),

                        _isVisible? Stack(
                          children: [
                            const VdoAd(),

                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               _isVisible? IconButton(onPressed: (){
                                 _toggleVisibility();
                                },
                                    icon: const Icon(Icons.cancel)):Container(),
                              ],
                            ),
                          ],
                        ):Container(),

                        const SizedBox(height: 20,),





                      // _isVisible?AdsLogin():Container(),
                      //
                      //   _isVisible?IconButton(onPressed: (){
                      //     _toggleVisibility();
                      //
                      //   },
                      //       icon: Icon(Icons.cancel)):Container(),



                        const Details(),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image(image: AssetImage("images/5star.png")),
                              Text("Google 4.9 * Rated Institute"),

                              SizedBox(height: 5,),

                              Text("SCOPE INDIA, your career partner!",
                              style: TextStyle(
                                fontSize: 22,
                                color: AppColor.backgroundColor,
                                fontWeight: FontWeight.w600
                              ),),

                              SizedBox(height: 5,),

                              Text("Software, Networking, and Cloud Professional Education Centre in Kerala from Suffix E Solutions with WORKING PROFESSIONALS oriented on-the-job TRAINING model. SCOPE INDIA provides courses for Software Programming in Python (Data Science | Artificial Intelligence | Machine Learning | Deep Learning, Data Analytics), Java, PHP, .Net, Software Testing Manual and Automation, Cloud Computing (AWS | Azure), Server Administration (MCSE | RHCE), Networking (CCNA), Mobile App Development in Flutter, and Digital Marketing. Training with 100% Trusted Job Based Internship Model. SCOPE INDIA has a Strong Placement Cell that provides jobs to thousands of students every year. We assure you, you won't regret it after training from SCOPE INDIA!"),

                              SizedBox(height: 5,),

                              Text("This is how SCOPE INDIA can support both newbies and experienced in the industry to upgrade their skills."),

                              // Image(image: AssetImage("images/Screenshot 2024-06-10 at 10.15.08 AM.png")),

                            ],
                          ),
                        ),

                      ],
                    ),

                    const Image(image: AssetImage("images/Screenshot 2024-06-10 at 10.13.30 AM.png")),

                  ],
                ),
              ),
            ),),
        ],),
    );
  }
}




