import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Technology Stack',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildTechCard(
                    imagePath: 'assets/icons/flutter.png',
                    title: 'Frontend',
                    subtitle: 'Flutter',
                    gradient:const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTechCard(
                    imagePath: 'assets/icons/dart.png',
                    title: 'Frontend',
                    subtitle: 'Dart',
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.cyan],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTechCard(
                    imagePath: 'assets/icons/firebase.png',
                    title: 'Backend',
                    subtitle: 'Firebase',
                    gradient: const LinearGradient(
                      colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTechCard(
                    imagePath: 'assets/icons/json.png',
                    title: 'Tools',
                    subtitle: 'JSON',
                    gradient: const LinearGradient(
                      colors: [Colors.greenAccent, Colors.tealAccent],
                    ),
                  ),
                ],
              ),
            ),

            ElevatedButton.icon(onPressed: () {
                FirebaseAuth.instance.signOut();
            }, label: const Text('Sign Out'))
          ],
        ),
      ),
    );
  }

  Widget _buildTechCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required Gradient gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30, // Increase the radius for larger icons
          backgroundColor: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
 