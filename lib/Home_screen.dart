// ignore_for_file: prefer_const_constructors, camel_case_types, file_names, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace

import 'dart:math';

import 'package:bmi_calculator/Result_screen.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/custom_button.dart';
import 'package:bmi_calculator/gender_container.dart';
import 'package:bmi_calculator/height_container.dart';
import 'package:bmi_calculator/selector_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isMaleActive = true;
  int age = 19, weight = 74;
  double height = 173;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    GenderContainer(
                      iconData: FontAwesomeIcons.male,
                      text: 'Male',
                      isActive: isMaleActive,
                      onTapped: () {
                        setState(() {
                          isMaleActive = true;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GenderContainer(
                        iconData: FontAwesomeIcons.female,
                        text: 'Female',
                        isActive: !isMaleActive,
                        onTapped: () {
                          setState(() {
                            isMaleActive = false;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                HeightContainer(
                    height: height,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round() * 1.0;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectorContainer(
                      text: 'Weight',
                      number: weight.toString(),
                      decrease: () {
                        changeNumber(isAgeChanging: false, isIncreasing: false);
                      },
                      increase: () {
                        changeNumber(isAgeChanging: false, isIncreasing: true);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SelectorContainer(
                      text: 'Age',
                      number: age.toString(),
                      decrease: () {
                        changeNumber(isAgeChanging: true, isIncreasing: false);
                      },
                      increase: () {
                        changeNumber(isAgeChanging: true, isIncreasing: true);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: CustomButton(
          text: 'Calculate my BMI',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              List result = bmiCalculator();
              return Resultscreen(
                bmi: result[0].toString(),
                status: result[1],
                icon: result[2],
                statusColor: result[3],
                tip: result[4],
              );
            }));
          },
        ),
      ),
    );
  }

  void changeNumber({
    required bool isAgeChanging,
    required bool isIncreasing,
  }) {
    if (isAgeChanging) {
      setState(() {
        if (isIncreasing) {
          // isIncreasing ? age++ : age--;
          if (age < 120) {
            age++;
          } else {
            // pass
          }
        } else {
          if (age > 1) {
            age--;
          } else {
            // pass
          }
        }
      });
    } else {
      setState(() {
        if (isIncreasing) {
          // isIncreasing ? weight++ : weight--;
          if (weight < 500) {
            weight++;
          } else {
            // pass
          }
        } else {
          if (weight > 3) {
            weight--;
          } else {
            // pass
          }
        }
      });
    }
  }

  List bmiCalculator() {
    double bmi = 0;
    String tip;
    Color statusColor;
    String status;
    Icon icon;
    bmi = weight / pow((height / 100), 2);
    if (bmi >= 18.5 && bmi <= 25) {
      status = 'Normal';
      icon = Icon(
        FontAwesomeIcons.solidFaceLaughWink,
        color: Colors.amber[300],
        size: 20,
      );
      statusColor = Colors.greenAccent;
      tip = 'You have a Normal body weight. Good job!';
    } else if (bmi < 18.5) {
      status = 'Under Weight';
      icon = Icon(
        FontAwesomeIcons.solidFaceFrown,
        color: Colors.amber[300],
        size: 20,
      );
      tip = 'You have a low body weight. Try to eat more!';
      statusColor = Colors.red;
    } else {
      status = 'Over Weight';
      icon = Icon(
        FontAwesomeIcons.solidFaceSadCry,
        color: Colors.amber[300],
        size: 20,
      );
      tip = 'You have a high body weight. Try to eat less!';
      statusColor = Colors.red;
    }

    return [bmi, status, icon, statusColor, tip];
  }
}
