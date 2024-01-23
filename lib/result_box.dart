// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final String status;
  final String bmi;
  final String tip;
  final Color statusColor;
  final VoidCallback onSavePressed;
  final Icon icon;

  ResultBox({
    required this.statusColor,
    required this.status,
    required this.bmi,
    required this.tip,
    required this.onSavePressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kActiveCardColor),
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              icon,
            ],
          ),
          Text(
            bmi.substring(
                0,
                bmi.indexOf(('.')) +
                    2), //This line is intended to display up to one decimal place.
            style: TextStyle(
              fontSize: 80,
            ),
          ),
          Column(
            children: [
              Text(
                'Normal BMI range:',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '18,5 - 25',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text(
            tip,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            padding: EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 20,
            ),
            onPressed: onSavePressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: kBackgroundColor,
            child: Text(
              'Save Result',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
