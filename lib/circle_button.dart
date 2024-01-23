// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class CircleBottun extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  CircleBottun({required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(
          child: Icon(
            iconData,
            color: kGreyColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
