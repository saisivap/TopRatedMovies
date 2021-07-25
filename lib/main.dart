import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/homeScreen.dart';
import 'package:movie_api/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: Themes().dartTheme,
      theme: Themes().lightTheme,
      home: const HomeScreen(),
    );
  }
}
