import 'package:cryptify/FirstScreen.dart';

import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';

void main() async {
  // await Hive.initFlutter();
  // const String fav = "favourites";
  // // var box = Hive.openBox("favourites");
  // await Hive.openBox(fav);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: FirstScreen(),
    );
  }
}
