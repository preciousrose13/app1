// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureFaceView extends StatefulWidget {
  final void Function(Uint8List) onImageCaptured;
  const CaptureFaceView({
    required this.onImageCaptured,
    super.key});

  @override
  State<CaptureFaceView> createState() => _CaptureFaceViewState();
}

class _CaptureFaceViewState extends State<CaptureFaceView> {
  late final ImagePicker picker;
  File? _image;

  @override
  void initState() {
    super.initState();

    picker = ImagePicker();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
                  radius: 140,
                  backgroundColor: MyColors.Peach,
                  backgroundImage: _image == null ? null : FileImage(_image!),
                  child: _image == null
                   ? Center(
                    child: Icon(
                      Icons.camera_alt, 
                      color: MyColors.Purple,
                      size: 60
                    ),
                  ) : null
                ),
                SizedBox(height: 50),

                GestureDetector(
                  onTap: () async {
                    setState(() {
                      _image = null;
                    });
                    final pickedImage = await picker.pickImage(
                      source: ImageSource.camera,
                      maxHeight: 400,
                      maxWidth: 400,
                    );

                    if (pickedImage == null) {
                      return;
                    }

                    final imagePath = pickedImage.path;

                    setState(() {
                      _image = File(imagePath);
                    });

                    final imageBytes = _image!.readAsBytesSync();

                    widget.onImageCaptured(imageBytes);
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.camera,
                      color: MyColors.Purple,
                      size: 30
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "Click here to Capture",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  )
                ),
      ],
    );
  }
}