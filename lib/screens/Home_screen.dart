
import 'package:emerging_tech/screens/about_hackathon.dart';
import 'package:emerging_tech/widgets/theme_logo.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    body: Center(
      child: Column(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.asset('assets/images/sparkathon.png'),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sparkathon is an open innovation challenge for Indian students to build cutting-edge tech solutions and create delightful shopping experiences. This year, you will have an exclusive opportunity to reimagine a new era of retail that is blurring the lines between the online and offline worlds more than ever Its time to code, collaborate and ideate! Put your best foot forward and showcase your innovative solutions',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500
              )
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 ThemeLogo(image: 'assets/images/data.png',title: 'Data',),
                  ThemeLogo(image: 'assets/images/supply.png',title: 'supply',),
                   ThemeLogo(image: 'assets/images/tech.png',title: 'Tech',),
                    ThemeLogo(image: 'assets/images/retail.png',title: 'Retail',)
                 
              ],),
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return const AboutHackathon();
                 },));
            }, child: const Text('Know more')),
          )

      ],),
    ),
   );
  }
}