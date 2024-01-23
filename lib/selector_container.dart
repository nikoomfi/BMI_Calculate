// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/circle_button.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectorContainer extends StatelessWidget {
  final String text;
  final String number;
  final VoidCallback increase;
  final VoidCallback decrease;

  SelectorContainer(
      {required this.text,
      required this.number,
      required this.decrease,
      required this.increase});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: kActiveCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18, color: kGreyColor),
            ),
            Text(
              number,
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: CircleBottun(
                    iconData: FontAwesomeIcons.circleMinus,
                    onPressed: decrease),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: CircleBottun(
                    iconData: FontAwesomeIcons.circlePlus, onPressed: increase),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
