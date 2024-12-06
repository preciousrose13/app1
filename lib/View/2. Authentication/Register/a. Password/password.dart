// ignore_for_file: unused_import, prefer_const_constructors

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/Resources/Text%20Field/textfield.dart';
import 'package:app1/View/2.%20Authentication/Register/b.%20Picture/register_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

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
                hintText: "Enter Password", 
                icon: Icons.lock_outline_rounded
              ),
        
              SizedBox(height: 20),
              MyButton(
                text: "Continue", 
                onTap: (){
                  Get.to(() => RegisterUser());
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}