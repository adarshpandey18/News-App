import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/widgets/loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Splash Screen Delay
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home_screen'));
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/splah_screen_image.png',
                height: heightScreen * 0.3,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: heightScreen * 0.05,
            ),
            const Text(
              "News App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: heightScreen * 0.05,
            ),
            const Loading(),
          ],
        ),
      ),
    );
  }
}
