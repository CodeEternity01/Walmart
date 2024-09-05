import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ayurvan/Authentication/repository/authentication_repo.dart';
import 'package:ayurvan/Authentication/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:ayurvan/util/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login Demo',
      theme: TAppTheme.lightTheme, // Custom light theme
      darkTheme: TAppTheme.darkTheme, // Custom dark theme
      themeMode: ThemeMode.system, // Switch based on system settings
      home: const SplashScreen(), // SplashScreen will be shown first
    );
  }
}
