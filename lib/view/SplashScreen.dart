import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rbt_app/view/homescreen/Dashboard_screen.dart';
import 'package:rbt_app/view/homescreen/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoardScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: Image.asset('assets/logo.png'),
          ),
        ),
      ),
    );
  }


}
