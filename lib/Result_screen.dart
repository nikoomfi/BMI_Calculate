// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/custom_button.dart';
import 'package:bmi_calculator/result_box.dart';
import 'package:flutter/material.dart';

class Resultscreen extends StatefulWidget {
  final String status;
  final String bmi;
  final String tip;
  final Color statusColor;
  final Icon icon;

  Resultscreen({
    required this.statusColor,
    required this.status,
    required this.bmi,
    required this.tip,
    required this.icon,
  });

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.keyboard_backspace_outlined),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Your Result',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              ResultBox(
                statusColor: widget.statusColor,
                bmi: widget.bmi,
                status: widget.status,
                tip: widget.tip,
                onSavePressed: () {
                  onSavePressed();
                },
                icon: widget.icon,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: CustomButton(
          text: 'Recalculate my BMI',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void onSavePressed() {
    // ToDo: onSavePressed
  }
}
