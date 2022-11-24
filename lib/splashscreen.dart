import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/Page/homepage.dart';
import 'package:melcosh_cafe/Page/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future<bool> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("email")) {
      Get.offAll(() => const HomePage(), duration: const Duration(seconds: 5));
      return true;
    } else {
      Get.offAll(() => const LoginPage(), duration: const Duration(seconds: 5));
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 50,
            ),
            const Text("MELCOSH CAFE")
          ],
        ),
      ),
    );
  }
}
