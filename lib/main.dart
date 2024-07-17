import 'package:flutter/material.dart';
import 'package:bookstore_app/screens/splash_screen.dart'; // Import SplashScreen from splash_screen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Start with SplashScreen instead of MenuPage
    );
  }
}

