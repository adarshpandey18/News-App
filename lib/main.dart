import 'package:flutter/material.dart';
import 'package:news_app/pages/home_screen.dart';
import 'package:news_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'News App',
      
      theme: ThemeData(
        useMaterial3: true,
      ),
      
      routes: {
        '/home_screen': (context) => const HomeScreen(),
        '/splash_screen': (context) => const SplashScreen(),
      },
      
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
