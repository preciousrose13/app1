// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/Resources/Capture%20Face%20View/faceview.dart';
import 'package:app1/View/2.%20Authentication/Register/c.%20Add%20Details/add_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String? imageData;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Purple,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 40),
                
                Image.asset(
                  'assets/home/meetmax.png',
                ),
                SizedBox(height: 40),
                
                CaptureFaceView(
                  onImageCaptured: (imageBytes) {
                    setState(() {
                    imageData = base64Encode(imageBytes);
                  });
                  },
                ),

                SizedBox(height: 40),
                if (imageData != null)
                  MyButton(
                    text: "Complete Profile", 
                    onTap: (){
                      Get.to(() => AddDetails(
                        image: imageData!,
                      ));
                    }
                  )

              ],
            ),
          ),
        ),
      )
    );
  }
}