import 'dart:async';

import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/auth/auth_screen.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('is_login');
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              isLogin == true ? const DashboardScreen() : const AuthScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Image.asset(
          Images.splash,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
