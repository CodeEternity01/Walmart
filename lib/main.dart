import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0071CE), // App bar color
        scaffoldBackgroundColor: Colors.white, // Background color
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Text color
          bodyMedium: TextStyle(color: Colors.black), 
          bodySmall: TextStyle(color: Colors.black),
          // Text color
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0071CE), // App bar color
          titleTextStyle: TextStyle(color: Colors.white), // App bar text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color(0xFF0071CE), // Button text color
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Press Me'),
        ),
      ),
    );
  }
}