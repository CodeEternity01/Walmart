import 'package:emerging_tech/screens/Home_screen.dart';
import 'package:emerging_tech/screens/problem_statement_screen.dart';
import 'package:emerging_tech/screens/solution_screen.dart';
import 'package:emerging_tech/screens/team_intro_screen.dart';
import 'package:emerging_tech/screens/tech_stack.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    

  final List<Widget> screens = [
    const HomeScreen(),
    const TeamIntroScreen(),
    const ProblemStatementScreen(),
    const SolutionScreen(),
    const TechStack(),
  ];

     return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Bar Example'),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
        
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_problem_outlined),
            label: 'Problem',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_volleyball_rounded),
            label: 'Solution',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adb),
            label: 'TechStack',
          ),
        ],
      ),
    );
  }
}