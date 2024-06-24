import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/pages/category_screen.dart';
import 'package:news_app/pages/home_screen.dart';
import 'package:news_app/pages/search_screen.dart';
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
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routes: {
        '/home_screen': (context) => const HomeScreen(),
        '/splash_screen': (context) => const SplashScreen(),
        '/category_screen': (context) => const CategoryScreen(),
        '/search_screen': (context) => const SearchScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
