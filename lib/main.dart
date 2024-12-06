// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'dart:io';

import 'package:app1/Resources/App%20Colors/appcolors.dart';
import 'package:app1/View/1.%20Splash%20Screen/splash.dart';
import 'package:app1/View/2.%20Authentication/Register/a.%20Password/password.dart';
import 'package:app1/View/3.%20Home%20Page/home.dart';
import 'package:app1/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_api_availability/google_api_availability.dart';

void ensureSecurityProviderInitialized() {
  if (Platform.isAndroid) {
    try {
      GoogleApiAvailability.instance.makeGooglePlayServicesAvailable().then((_) {
        print('Google Play Services are available.');
      }).catchError((error) {
        print('Failed to ensure Google Play Services availability: $error');
      });
    } catch (e) {
      print('Error initializing security provider: $e');
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  ensureSecurityProviderInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}