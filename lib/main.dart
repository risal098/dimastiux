import 'package:dimastiui/screens/about_us.dart';
import 'package:flutter/material.dart';
import "./screens/login_page.dart";
import 'package:get/get.dart';

//import './screens/homePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
