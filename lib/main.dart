import 'package:beehive_app/Focus/breathing_exercises.dart';
import 'package:beehive_app/Focus/focus_main.dart';
import 'package:beehive_app/Landing%20Page/LandingPage.dart';
import 'package:beehive_app/Landing%20Page/LandingPageUpdate.dart';
import 'package:beehive_app/Welcome/Login.dart';
import 'package:beehive_app/Welcome/SignUp.dart';
import 'package:beehive_app/Welcome/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:beehive_app/Focus/breathing_exercises.dart';
import 'package:beehive_app/bnav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beehive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Nav(),
      //home: focusMain(),
    );
  }
}
