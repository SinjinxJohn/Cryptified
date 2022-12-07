import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
