// ignore_for_file: unused_import

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/View/2.%20Authentication/Login/a.%20Login/login.dart';
import 'package:app1/View/2.%20Authentication/Register/a.%20Password/password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Purple,
      body: Container(
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
            SizedBox(height: 20),
            Text(
              "Together we\n are a force",
              style: TextStyle(
                color: MyColors.Peach,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
      
            SizedBox(height: 20),
            MyButton(
              text: "Login", 
              onTap: (){
                Get.to(() => LoginPage());
              }
            ),
            SizedBox(height: 20),
            MyButton(
              text: "Register", 
              onTap: (){
                Get.to(() => PasswordPage());
              }
            )
          ],
        ),
      ),
    );
  }
}