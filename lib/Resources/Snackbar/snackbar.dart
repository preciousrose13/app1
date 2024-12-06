// ignore_for_file: unnecessary_import, prefer_const_constructors

import 'package:app1/Resources/App Colors/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

errorSnackBar(BuildContext context, String content) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

successSnackBar(BuildContext context, String content) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        )
      ),
      backgroundColor: MyColors.Peach,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 5),
    ),
  );
}
