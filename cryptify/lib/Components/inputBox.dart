import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  String value;
  InputBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        child: TextField(
          decoration:
              InputDecoration(hintText: value, border: OutlineInputBorder()),
        ));
  }
}
