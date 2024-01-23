// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isActive;
  final VoidCallback onTapped;

  GenderContainer(
      {required this.iconData,
      required this.text,
      required this.isActive,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: kActiveCardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTapped,
          child: Container(
            width: 150,
            height: 130,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Icon(
                  iconData,
                  size: 80,
                  color: isActive ? kPinkColor : kGreyColor,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      color: kGreyColor,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
