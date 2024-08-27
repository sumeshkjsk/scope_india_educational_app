
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// void main(){
//   runApp(ImagePickers());
// }

class ImagePickers extends StatefulWidget {
  const ImagePickers({super.key});

  @override
  State<ImagePickers> createState() => _ImagePickersState();

  pickImage({required ImageSource source}) {}
}

class _ImagePickersState extends State<ImagePickers> {
  File? _imageFiles;
  Future<void>captureImage() async {
    ImagePicker _imagePicker = ImagePicker();
    final pickedFile = await
    _imagePicker.pickImage(source:ImageSource.camera);
    if (pickedFile == null)
      print("value is null");
    setState(() {
      _imageFiles = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Picker App"),
        ),

        body: Column(
          children: [
            Container( width: 200,
              height: 300,
              child: Center(
                child: _imageFiles !=null?
                Image.file(_imageFiles!):Text("no data selected"),

              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: (){
            captureImage();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

