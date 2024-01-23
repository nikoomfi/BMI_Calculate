// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class HeightContainer extends StatelessWidget {
  final double height;
  final Function(double value) onChanged;

  HeightContainer({required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 140,
      color: kActiveCardColor,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'height',
            style: TextStyle(fontSize: 18, color: kGreyColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                height.toStringAsFixed(0),
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'cm',
                style: TextStyle(
                  fontSize: 10,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
          Slider(
              value: height,
              min: 40,
              max: 260,
              thumbColor: kPinkColor,
              activeColor: kPinkColor,
              onChanged: onChanged),
        ],
      ),
    );
  }
}
