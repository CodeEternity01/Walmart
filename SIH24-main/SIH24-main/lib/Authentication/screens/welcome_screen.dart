import 'package:flutter/material.dart';
import 'package:ayurvan/Authentication/screens/login.dart';
import 'package:ayurvan/Authentication/screens/sign_up.dart';
import 'package:ayurvan/constant/Text.dart';
import 'package:ayurvan/constant/color.dart';
import 'package:ayurvan/constant/image.dart';
import 'package:ayurvan/constant/size.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image section
            Image.asset(
              tWelcomeScreenImage,
              height: size.height * 0.55,
            ),
            const SizedBox(height: 20),

            // Text section
            Text(
              "Welcome to AyurVan",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                
"Explore medicinal plants, join our community, and enjoy immersive 3D tours with expert guides and personalized care tips.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            // Button section
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => toLogin(context),
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      foregroundColor: const Color(0xFF618867),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: tSecondaryColor),
                    ),
                    child: Text(
                      tlogin.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => toSignUp(context),
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF618867),
                    ),
                    child: Text(
                      tsignup.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void toSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }
}
