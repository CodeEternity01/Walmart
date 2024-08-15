
import 'package:emerging_tech/firebase_options.dart';
import 'package:emerging_tech/screens/Home_screen.dart';
import 'package:emerging_tech/screens/auth.dart';
import 'package:emerging_tech/screens/tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    
    const ProviderScope(child: MyApp(
    
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          
          return  const Tabs();
        }

        return const AuthScreen();
      },
      ),
    );
  }
}

