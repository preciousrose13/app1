// ignore_for_file: prefer_const_constructors, invalid_use_of_visible_for_testing_member, use_build_context_synchronously, duplicate_ignore, unnecessary_cast

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app1/Model/usermodel.dart';
import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/Resources/Capture%20Face%20View/faceview.dart';
import 'package:app1/Resources/Snackbar/snackbar.dart';
import 'package:app1/View/2.%20Authentication/Login/b.%20User%20Authenticated/user_authenticated.dart';
import 'package:app1/View/2.%20Authentication/Login/c.%20Scanning%20Animation/2.animated_view.dart';
import 'package:app1/View/3.%20Home%20Page/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:get/get.dart';
import 'package:flutter_face_api/flutter_face_api.dart' as regula;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final faceSdk = FaceSDK.instance;
  late regula.MatchFacesImage image1;
  late regula.MatchFacesImage image2;

  bool canAuthenticate = false;
  bool faceMatched = false;
  bool isMatching = false;

  String similarity = "";

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
                
                Column(
                  children: [
                    Stack(
                      children: [
                        CaptureFaceView(
                          onImageCaptured: (imageBytes) {
                            image1 = regula.MatchFacesImage(
                              Uint8List.fromList(imageBytes),
                              regula.ImageType.PRINTED,
                            );

                            setState(() {
                              canAuthenticate = true;
                            });
                          },
                        ),
                        if (isMatching)
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 52),
                              child: AnimatedView(),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 40),

                if (canAuthenticate)
                  MyButton(
                   text: "Login", 
                    onTap: () {
                      setState(() {
                        isMatching = true;
                      });

                      FirebaseFirestore.instance
                          .collection('users')
                          .get()
                          .then((snap) async {
                        if (snap.docs.isNotEmpty) {
                          
                          for (var doc in snap.docs) {
                            final user = User.fromJson(doc.data());

                            image2 = regula.MatchFacesImage(
                              Uint8List.fromList(base64Decode(user.image)),
                              regula.ImageType.PRINTED,
                            );

                            var request = regula.MatchFacesRequest([image1, image2]);

                            var value = await faceSdk.matchFaces(request);

                            var response = value as regula.MatchFacesResponse;

                            if (response?.results != null && response!.results.isNotEmpty) {
                              var matchedFaces = response.results.where((result) => result.similarity > 0.75);

                              if (matchedFaces.isNotEmpty) {
                                similarity = (matchedFaces.first.similarity * 100).toStringAsFixed(2);

                                if (double.parse(similarity) > 90.00) {
                                  faceMatched = true;

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UserAuthenticatedPage(name: user.name),
                                    ),
                                  );
                                  return;
                                }
                              }
                            } else {
                              similarity = "No match found";
                            }
                          }

                          setState(() {
                            isMatching = false;
                          });

                          if (!faceMatched) {
                            errorSnackBar(context, 'User not found');
                          }
                        } else {
                          errorSnackBar(context, 'No users registered');
                        }
                      });
                    },
                  )

              ],
            ),
          ),
        ),
      )
    );
  }
}