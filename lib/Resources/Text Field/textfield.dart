import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final GlobalKey? formFieldKey;

  const MyTextField({
    required this.hintText,
    required this.icon,
    this.formFieldKey,
    this.controller,
    this.validate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: MyColors.Peach, width: 1),
                ),
                child: TextFormField(
                  key: formFieldKey,
                  controller: controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hintText,
                    prefixIcon: Icon(icon, color: MyColors.Peach,),
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w400
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    )
                ),
                validator: validate,
               ),
              );
  }
}