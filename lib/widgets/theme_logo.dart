import 'package:flutter/material.dart';

class ThemeLogo extends StatelessWidget {
  const ThemeLogo({super.key,required this.image,required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: const BoxDecoration(
        color: Color(0xFF0071CE)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,scale: 2.9),
           Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}