import 'package:cryptify/loginpage.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset("animation/moving.json"),
          ),
          Text("CRYPTIFIED",
              style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      // offset: Offset(4.0, 4.0),
                      blurRadius: 20.0,
                      color: Colors.white,
                    )
                  ],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
        ],
      ),
    );
  }
}
