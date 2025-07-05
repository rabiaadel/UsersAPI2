import 'package:flutter/material.dart';

class Customfieldwidget extends StatelessWidget {
  Customfieldwidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "$hintText",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.blue),
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
