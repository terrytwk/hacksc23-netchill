import 'package:flutter/material.dart';

class MyTextFieldId extends StatelessWidget {
  final controller;
  // final prefixIcon;
  final String hintText;
  final bool obscureText;

  const MyTextFieldId({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            // box color
            fillColor: Colors.grey.shade100,
            filled: true,
            prefixIcon: Icon(Icons.email, color: Colors.blue[500]),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
