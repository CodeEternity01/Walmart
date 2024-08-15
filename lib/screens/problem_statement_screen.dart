import 'package:flutter/material.dart';

class ProblemStatementScreen extends StatelessWidget {
  const ProblemStatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Problem Statement',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'SmartBasket: Personalized Shopping Experience',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'In today\'s fast-paced world, customers are looking for more personalized shopping experiences. '
                'Walmart, being one of the largest retail chains, faces challenges in catering to diverse customer needs. '
                'The traditional shopping model lacks the ability to provide tailored recommendations that consider individual preferences, dietary needs, and lifestyle choices.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LearnMoreScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Our Solution',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 40), 
            ],
          ),
        ),
      ),
    );
  }
}
class LearnMoreScreen extends StatelessWidget {
  const LearnMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Background color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.orangeAccent, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          // Solution Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Solution',
              style: TextStyle(
                fontSize: 28,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Discover the benefits of our solution:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Features List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                buildFeatureBox(
                  context,
                  number: '1',
                  title: 'Personalized Basket Recommendations',
                  description:
                      'Tailor shopping suggestions based on individual preferences and dietary requirements, ensuring a customized and relevant shopping experience.',
                  color: Colors.orangeAccent,
                ),
                const SizedBox(height: 16),
                buildFeatureBox(
                  context,
                  number: '2',
                  title: 'Basket Customization',
                  description:
                      'Allow users to modify their basket with ease, including adding, removing, or adjusting items to fit their specific needs and preferences.',
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 16),
                buildFeatureBox(
                  context,
                  number: '3',
                  title: 'Product Shortlisting',
                  description:
                      'Enables users to shortlist products they are interested in, facilitating easier comparison and decision-making during their shopping process.',
                  color: Colors.teal,
                ),
                const SizedBox(height: 16),
                buildFeatureBox(
                  context,
                  number: '4',
                  title: 'Expiry Date Notifications',
                  description:
                      'Sends reminders to users about the expiry dates of products in their basket or past purchases, helping them manage their stock and reduce waste.',
                  color: Colors.redAccent,
                ),
                const SizedBox(height: 16),
                buildFeatureBox(
                  context,
                  number: '5',
                  title: 'Reordering System',
                  description:
                      'Provides a seamless way to reorder frequently purchased items with a single click, streamlining the shopping process and saving time for users.',
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureBox(BuildContext context,
      {required String number,
      required String title,
      required String description,
      required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.4)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
         const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}