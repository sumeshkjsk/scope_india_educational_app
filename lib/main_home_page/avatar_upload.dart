import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/color_theme.dart';



class AvatarUpload extends StatefulWidget {
  const AvatarUpload({super.key});

  @override
  _AvatarUploadState createState() => _AvatarUploadState();
}

class _AvatarUploadState extends State<AvatarUpload> {
  File? _image;

  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("image:: ${_image}");
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("picker ${picker}");
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Container(
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
            Text("Upload Avatar",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

            _image == null
                ? const Text('No image selected.')
                : Image.file(_image!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                TextButton(
                  onPressed: getImageFromCamera,
                  child: Text('Camera'),
                ),
                const SizedBox(width: 30,),
                TextButton(
                  onPressed: getImageFromGallery,
                  child: const Text('Gallery'),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
