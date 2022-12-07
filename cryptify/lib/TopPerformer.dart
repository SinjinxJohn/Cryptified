import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopPerformer extends StatefulWidget {
  const TopPerformer({super.key});

  @override
  State<TopPerformer> createState() => _TopPerformerState();
}

class _TopPerformerState extends State<TopPerformer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("Hello"),
      ),
    );
  }
}
