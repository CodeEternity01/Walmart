import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,required this.name,required this.imageUrl,required this.type});
  final String name;
  final String imageUrl;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Card(
      
      elevation: 1.2,
      child: Center(
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150, // Ensure width matches the outer container
                height: 100, // Adjust height to give space for logo and text
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                  image:  DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 4),
              child: Row(
               
                children: [
                  Image.asset(
                   type == 'Non-Vegetarian' ?'assets/images/non veg.png':'assets/images/veg.png', // Replace with your logo asset
                    width: 20, // Adjust size as needed
                    height: 20, // Adjust size as needed
                  ),
                  const SizedBox(width: 8), // Space between logo and text
                   Expanded(
                    child: Text(
                      name, // Replace with your desired name
                      overflow: TextOverflow.ellipsis, // Handles text overflow
                      style: const TextStyle(
                      //  color: Colors.white, // Text color
                        fontWeight: FontWeight.bold, // Text weight
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
