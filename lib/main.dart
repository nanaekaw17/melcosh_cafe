import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Melcosh Cafe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'poppins',
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.blue, //change your color here
          ),
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
