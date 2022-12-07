import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResuableButton extends StatelessWidget {
  final String text;
  final Color color;
  ResuableButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      //     decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      // )
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
    );
  }
}
