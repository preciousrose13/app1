// ignore_for_file: prefer_const_constructors

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/Resources/Button/button.dart';
import 'package:app1/View/3.%20Home%20Page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAuthenticatedPage extends StatelessWidget {
  final String name;

  const UserAuthenticatedPage({
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Purple,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/home/logo.png',
                height: 200,
              ),
              SizedBox(height: 50),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: MyColors.Peach,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: MyColors.Peach,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Hey, ${name.toUpperCase()}!',
                style: TextStyle(
                  color: MyColors.Peach,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
              Text(
                'You are Successfully Authenticated!',
                style: TextStyle(
                  color: MyColors.Peach.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              MyButton(
                text: 'Go to Home', 
                onTap: () {
                  Get.to(() => HomePage(
                    name: name,
                  ));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
