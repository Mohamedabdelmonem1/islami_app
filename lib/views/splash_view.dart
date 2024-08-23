import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app_route/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "/";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/splash_screen.png",
      fit: BoxFit.cover,
    );
  }
}
