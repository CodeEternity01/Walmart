import 'package:emerging_tech/screens/problem_statement_screen.dart';
import 'package:emerging_tech/screens/solution_screen.dart';
import 'package:emerging_tech/screens/team_intro_screen.dart';
import 'package:emerging_tech/screens/tech_stack.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
    body: Text('Home screen'),
   );
  }
}