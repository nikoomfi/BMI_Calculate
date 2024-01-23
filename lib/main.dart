// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/Home_screen.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
