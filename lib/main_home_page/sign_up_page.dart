import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fourthpro/app_main_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/color_theme.dart';
import 'login_page.dart';


class SignUpPage extends StatefulWidget {

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _firestore = FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();
  final _fnamectrl = TextEditingController();
  final _lnamectrl = TextEditingController();
  final _datectrl = TextEditingController();

  DateTime dateTime = DateTime.now();

  Future<void> getemail()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", _emailctrl.text);
  }

  Future<void>getdate()async{
    final DateTime currentdate = DateTime.now();
    final DateTime? selecteddate = await showDatePicker(
        context: context, firstDate: DateTime(currentdate.year-50),
        lastDate: currentdate,
        initialDate: currentdate);
    if(selecteddate!=null){
      _datectrl.text=formatdate(selecteddate);
    }
  }
  String formatdate(DateTime date){
    return "${date.day.toString().padLeft(2,"0")}-${date.month.toString().padLeft(2,"0")}-${date.year}";
  }

  final _emailctrl = TextEditingController();
  final _phnumberctrl = TextEditingController();

  final  _country = TextEditingController();
  final  _state = TextEditingController();
  final  _city = TextEditingController();

  String? gendervalue;

  List<String> items = [
    "Reading",
    "Writing",
    "Drawing",
    "Travel",
    "Sleeping"
  ];
  List<String> selectedItem = [];

  File? _image;
  String? imageUrl;

  // Function to handle image picking and upload
  Future<void> _pickImageAndUpload() async {
    // Use ImagePicker to get image from camera
    final ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    try {
      pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    } catch (e) {
      print('Error picking image: $e');
    }

    // If image was picked, set state to update UI
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile!.path);
      });

      // Upload image to Firebase Storage
      try {
        String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageReference = FirebaseStorage.instance.ref().child("images/$uniqueFileName");
        await storageReference.putFile(File(pickedFile.path));

        // Get download URL of uploaded image
        String downloadURL = await storageReference.getDownloadURL();
        setState(() {
          imageUrl = downloadURL;
        });
      } catch (e) {
        print('Error uploading image to Firebase Storage: $e');
      }
    } else {
      print('No image selected.');
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: CustomScrollView(
          slivers: [
      SliverAppBar(backgroundColor: Colors.brown[50],
      iconTheme: const IconThemeData(color: AppColor.blackColor),
      expandedHeight: 70,
      centerTitle: true,
      title: Image(
        image: const AssetImage("images/scope-india-logo-bird.png"),
        height: 70,
        color: Colors.blue[900],),
        pinned: true,

    ),

        SliverToBoxAdapter(
        child: Column(
          children: [

            Container(
                color: AppColor.backgroundColor,
                child: const Image(image: AssetImage("images/scope-india-logo-web.png"),)),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text("Sign Up.",
                    style: TextStyle(
                      color: AppColor.backgroundColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _fnamectrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("First Name"),
                      ),

                      validator: (value) {
                        if (value==null || value.isEmpty || value.length<=2) {
                          return 'Please Enter your first name';
                        }
                        if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                          return 'First Name should start with a capital letter';
                        }
                        return null; // Return null if the validation passes
                      },
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _lnamectrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("Last Name"),
                      ),

                      validator: (value) {
                        if (value==null || value.isEmpty) {
                          return 'Please Enter your last name';
                        }
                        if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                          return 'Last Name should start with a capital letter';
                        }
                        return null; // Return null if the validation passes
                      },
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _datectrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("Date of Birth"),
                      ),
                      onTap: () {
                        getdate();
                      },
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _emailctrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("Email ID"),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        // Regular expression for email validation
                        RegExp regExp = RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                          caseSensitive: false,
                          multiLine: false,
                        );
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null; // Return null if the validation passes
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 10,),

                    TextFormField(
                      controller: _phnumberctrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("Phone Number"),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // Regular expression for phone number validation
                        RegExp regExp = RegExp(
                          r'^[0-9]{10}$',
                          caseSensitive: false,
                          multiLine: false,
                        );
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null; // Return null if the validation passes
                      },
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 10,),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.greyColor,
                          width: 1.3
                        )
                      ),
                      child: Row(
                        children: [
                          const Text("  Gender :  ",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                          RadioMenuButton(value: "Male", groupValue: gendervalue,
                              onChanged: (String? value){
                                setState(() {
                                  if(gendervalue==value){
                                    gendervalue=null;
                                  } else{
                                    gendervalue = value;
                                  }
                                });
                              }, child: const Text("Male")),

                          RadioMenuButton(
                            value: "Female", groupValue: gendervalue,
                            onChanged: (String? value){
                              setState(() {
                                if(gendervalue==value){
                                  gendervalue=null;
                                } else{
                                  gendervalue=value;
                                }
                              });
                            }, child: const Text("Female"),
                          )],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // CountryStateCity(),
    Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    CountryStateCityPicker(
    country: _country,
    state: _state,
    city: _city,
    dialogColor: Colors.grey.shade200,
    textFieldDecoration: const InputDecoration(
    suffixIcon: Icon(Icons.arrow_drop_down_outlined),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10))
    ))),

    ],
    ),
    ),

                    const SizedBox(height: 10),

                    Container(width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColor.greyColor,
                              width: 1.3
                          )
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 3,),
                          const Row(
                            children: [
                              Text("  Hobbies  :",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                            ],
                          ),

                          ...items
                              .map((e) => CheckboxListTile(
                            value: selectedItem.contains(e),
                            onChanged: (value) {
                              if (selectedItem.contains(e)) {
                                selectedItem.remove(e);
                              } else {
                                selectedItem.add(e);
                              }
                              setState(() {});
                            },
                            title: Text(e),
                          )),
                        ],
                      ),
                    ),

                    const SizedBox(height: 3),

                 IconButton(onPressed: () async {
                   ImagePicker imagePicker = ImagePicker();
                  XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                  print("${file?.path}");

                  setState(() {
                    if(file != null){
                      _image = File(file.path);
                    }else {
                      print('No image selected.');
                    }
                  });

                  if(file==null)return;

                  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

                   Reference referenceRoot = FirebaseStorage.instance.ref();
                   Reference referencePathImages = referenceRoot.child("images");

                   Reference referenceImagetoUpload = referencePathImages.child(uniqueFileName);

                   try{
                    await referenceImagetoUpload.putFile(File(file.path));
                    imageUrl = await referenceImagetoUpload.getDownloadURL();

                   }catch(error){
                     //error, if found
                     print('Error : $error');
                   }
                   },

    icon:   Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColor.greyColor,
              width: 1.3
          )
      ),
    child: Column(
      children: [
        const Text("Your Profile Pic",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
        _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ],
    ),
    ),
                 ),



                    const SizedBox(height: 10,),

                   SizedBox(
                   width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: ()async{
                          await getemail();
                          try{

                            if(_formkey.currentState!.validate()) {

                                final existingUser = await FirebaseFirestore.instance.collection("USERS").where("Email ID", isEqualTo: _emailctrl.text).get();
                                if(existingUser.docs.isNotEmpty){

                                  ScaffoldMessenger.of(context).showSnackBar(const
                                  SnackBar(content: Text(
                                    "Email ID Already Exist",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    backgroundColor: AppColor.backgroundColor,
                                  ));

                                  print("in email prfs of login:${_emailctrl.text}");

                                  return;
                                }


                                  User? user = FirebaseAuth.instance.currentUser;


                              await _firestore.collection("USERS").doc(_emailctrl.text).set({
                                "Registered Date" : dateTime.toString(),
                                'userId': user?.uid,
                                "First Name": _fnamectrl.text,
                                "Last Name": _lnamectrl.text,
                                "Date of Birth": _datectrl.text,
                                "Email ID": _emailctrl.text,
                                "Phone Number": _phnumberctrl.text,
                                "Gender": gendervalue,
                                "Contry": _country.text,
                                "State": _state.text,
                                "City": _city.text,
                                "Hobbies": selectedItem.toString(),
                                "Profile Pic": imageUrl,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: AppColor.backgroundColor,
                                      content: Text("Added Successfully",
                                        style: TextStyle(
                                            color: AppColor.greenColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                        ),
                                      )));

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                            }
                          }catch(error){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error : $error")));
                          }

                     },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(7),
    )
    ),
                     child: const Text("Sign Up Now",
                    style: TextStyle(
                     fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColor.whiteColor,
    ),)),
    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const AppMainPage()));
                      },
                      child: const Row(mainAxisAlignment: MainAxisAlignment
                          .center,
                        children: [
                          Text("Already have an Account,    "),
                          Text("Sign In.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),),
                        ],
                      ),
                    ),


                    const SizedBox(height: 50,),

                        ],
                ),
              ),
            ),
          ],
        ),),
  ],),
    );
  }
}



