import 'package:emerging_tech/screens/about_hackathon.dart';
import 'package:emerging_tech/widgets/theme_logo.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              // decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Color(0xFF2196F3), Color(0xFF9C27B0)],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //   ),
              // ),
            ),
          ),
          
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Animated Image with Hero Transition
                  Hero(
                    tag: 'sparkathon-logo',
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(seconds: 2),
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset('assets/images/sparkathon.png'),
                        ),
                      ),
                    ),
                  ),
                  
                  // Animated Text
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10.0,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        'Sparkathon is an open innovation challenge for Indian students to build cutting-edge tech solutions and create delightful shopping experiences. This year, you will have an exclusive opportunity to reimagine a new era of retail that is blurring the lines between the online and offline worlds more than ever. It’s time to code, collaborate and ideate! Put your best foot forward and showcase your innovative solutions',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  
                  // Animated Row of Containers
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ThemeLogo(image: 'assets/images/data.png', title: 'Data'),
                          ThemeLogo(image: 'assets/images/supply.png', title: 'Supply'),
                          ThemeLogo(image: 'assets/images/tech.png', title: 'Tech'),
                          ThemeLogo(image: 'assets/images/retail.png', title: 'Retail'),
                        ],
                      ),
                    ),
                  ),
            
                  // Animated Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const AboutHackathon();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Know more'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
