import 'package:cryptify/Components/Button.dart';
import 'package:cryptify/Components/inputBox.dart';
import 'package:cryptify/bottomnavbar.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 300,
                  child: Lottie.asset("animation/stonks.json"),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              InputBox(value: "Enter your username"),
              SizedBox(
                height: 5,
              ),
              InputBox(value: "Enter the password"),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => bottomNav())));
                  },
                  child: ResuableButton(
                      text: "Login", color: Colors.indigo.shade700)),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Forgot password, navigate to retrieve screen ");
                },
                child: Container(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
