import 'package:cryptify/Components/Button.dart';
import 'package:cryptify/Components/inputBox.dart';
import 'package:cryptify/bottomnavbar.dart';
// import 'package:cryptify/bottomnavbar.dart';
import 'package:cryptify/homePage.dart';

import 'package:flutter/material.dart';
//
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      final response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const bottomNav()),
        );
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
              InputBox(
                  value: "Enter the email",
                  controller: _emailController,
                  obscure: false),
              SizedBox(
                height: 5,
              ),
              InputBox(
                  value: "Enter the password",
                  controller: _passwordController,
                  obscure: true),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => bottomNav()),
                    // );
                    login(_emailController.text.toString(),
                        _passwordController.text.toString());
                  },
                  child: ResuableButton(
                      text: "Login", color: Color.fromARGB(255, 68, 247, 68))),
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
