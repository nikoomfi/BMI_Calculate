// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        color: kPinkColor,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
