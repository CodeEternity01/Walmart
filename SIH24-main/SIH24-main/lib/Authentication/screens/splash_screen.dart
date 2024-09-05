import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ayurvan/Authentication/repository/authentication_repo.dart';
import 'package:ayurvan/Authentication/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:ayurvan/firebase_options.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start Firebase initialization and navigation
    startInitialization();
  }

  Future<void> startInitialization() async {
    try {
      // Initialize Firebase
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // Put the AuthenticationRepo instance in GetX dependency management
      Get.put(AuthenticationRepo());

      // Wait for a bit to simulate splash screen display
      await Future.delayed(const Duration(seconds: 5));

      // Navigate to WelcomeScreen after Firebase initialization
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
        );
      }
    } catch (e) {
      // Handle initialization errors
      print('Firebase initialization error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to your desired background color or gradient
      body: Center(
        child: Image.asset(
          'assets/images/icon.jpg', // Ensure this path is correct
          width: 200, // Adjust size if necessary
          height: 200, // Adjust size if necessary
        ),
      ),
    );
  }
}
