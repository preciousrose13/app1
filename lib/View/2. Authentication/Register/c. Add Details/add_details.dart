// ignore_for_file: unused_import, unnecessary_null_comparison, prefer_const_constructors, use_build_context_synchronously

import 'package:app1/Model/usermodel.dart';
import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/Resources/Snackbar/snackbar.dart';
import 'package:app1/Resources/Text%20Field/textfield.dart';
import 'package:app1/View/3.%20Home%20Page/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddDetails extends StatefulWidget {
  final String image;
  const AddDetails({
    required this.image,
    super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  final nameController = TextEditingController();
  final formFieldKey = GlobalKey<FormFieldState>();
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Purple,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                'assets/home/logo.png',
                height: 200,
              ),
              Image.asset(
                'assets/home/teamicons.png',
                height: 200,
              ),
              SizedBox(height: 50),

              MyTextField(
                formFieldKey: formFieldKey,
                controller: nameController,
                hintText: "Enter Name", 
                icon: Icons.person_outline,
                validate: (val){
                  if (val!.isEmpty || val == null) {
                    return "Enter Your Name";
                  }
                  return null;
                },
              ),
        
              SizedBox(height: 20),

              MyButton(
                text: "Register Now", 
                onTap: (){
                  if (formFieldKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();

                    final name = nameController.text;

                    final userId = Uuid().v4();

                    final newUser = User(
                      id: userId,
                      name: name,
                      image: widget.image,
                    );

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .set(
                          newUser.toJson(),
                        )
                        .then((value) {
                      Navigator.of(context).pop();

                      successSnackBar(context, 'Registration success!');

                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop();
                      });
                    }).catchError((e) {
                      Navigator.of(context).pop();

                      errorSnackBar(context, 'Registration Failed!');
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}