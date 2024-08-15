import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TeamIntroScreen extends StatefulWidget {
  const TeamIntroScreen({super.key});

  @override
  State<TeamIntroScreen> createState() => _TeamIntroState();
}

class _TeamIntroState extends State<TeamIntroScreen> with SingleTickerProviderStateMixin {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'Nikhil Gour',
      skills: 'Flutter, C++, Firebase',
      bio: 'A passionate developer with experience in mobile and web apps.',
      imageUrl: "assets/images/Nikhil.png",
    ),
    TeamMember(
      name: 'Naman Nayank',
      skills: 'Python, Dart, MySQL',
      bio: 'Specialist with a knack for solving complex problems.',
      imageUrl: "assets/images/Naman.png",
    ),
    TeamMember(
      name: 'Satyam Pandey',
      skills: 'UI/UX Design, Fluter, Sketch',
      bio: 'Creative designer focused on creating seamless user experiences.',
      imageUrl: "assets/images/Satyam.png",
    ),
    TeamMember(
      name: 'Rahul Meena',
      skills: 'Problem Solving Expert,C++,Dart',
      bio: 'Full-stack developer with a passion for building scalable apps.',
      imageUrl: "assets/images/Rahul.jpg",
    ),
  ];

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
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
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                logoWidget("assets/images/teamlogo.jpeg"),
                const SizedBox(height: 20.0),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'The Bug Buster',
                      textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontFamily: 'Agne',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      speed: const Duration(milliseconds: 600),
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 200),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 16.0,
                        childAspectRatio: 0.75, // Adjust height/width ratio
                      ),
                      itemCount: teamMembers.length,
                      itemBuilder: (context, index) {
                        return TeamMemberCard(
                          member: teamMembers[index],
                        );
                      },
                    ),
                  ),
                ),
                ContactButton(
                  buttonText: "Let's Collaborate",
                  buttonIcon: Icons.handshake,
                  onPressed: () {
                    // Define the action when the button is pressed
                    print("Contact button pressed!");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String skills;
  final String bio;
  final String imageUrl;

  TeamMember({
    required this.name,
    required this.skills,
    required this.bio,
    required this.imageUrl,
  });
}

class TeamMemberCard extends StatefulWidget {
  final TeamMember member;

  const TeamMemberCard({super.key, required this.member});

  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard>
    with SingleTickerProviderStateMixin {
  bool showBio = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _toggleCard() {
    if (showBio) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      showBio = !showBio;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isFront = _animation.value < 0.5;
          final angle = _animation.value * pi; // Rotation angle (in radians)

          return Transform(
            transform: Matrix4.rotationY(angle)
              ..setEntry(3, 2, 0.001), // Adds a slight perspective
            alignment: Alignment.center,
            child: isFront
                ? _buildFrontCard()
                : Transform(
                    transform: Matrix4.rotationY(pi), // Rotate the back card to make it visible
                    alignment: Alignment.center,
                    child: _buildBackCard(),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildFrontCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.member.imageUrl),
              radius: 55,
            ),
            const SizedBox(height: 10),
            Text(
              widget.member.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.member.skills,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            widget.member.bio,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

Widget logoWidget(String imageName) {
  return ClipOval(
    child: Image.asset(
      imageName,
      fit: BoxFit.cover,
      width: 170,
      height: 170,
    ),
  );
}

class ContactButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final VoidCallback onPressed;

  const ContactButton({super.key, 
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      alignment: Alignment.center,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(buttonIcon, size: 24, color: Colors.white),
        label: Text(
          buttonText,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          backgroundColor: Colors.transparent,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ).copyWith(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        ),
      ).withGradient(),
    );
  }
}

extension GradientButton on ElevatedButton {
  Widget withGradient() {
    return Ink(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: this,
    );
  }
}