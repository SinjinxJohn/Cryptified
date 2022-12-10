import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  String value;
  TextEditingController controller;
  bool obscure;
  InputBox(
      {super.key,
      required this.value,
      required this.controller,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration:
              InputDecoration(hintText: value, border: OutlineInputBorder()),
        ));
  }
}
