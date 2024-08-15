import 'package:emerging_tech/screens/ingredient_screen.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key,required this.meal});
  final dynamic meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(meal['name'],style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Select No. of person for meal',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute the buttons evenly
              children: [
                // Person One Button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.person),
                      iconSize: 50.0, // Set the size of the icon
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return  IngredientScreen(
                            meal: meal['ingredients']['1_person'],
                            mealname: meal['name'],
                         );
                       },));
                      },
                    ),
                    const Text('One'),
                  ],
                ),
                // Person Two Button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.people_alt_sharp),
                      iconSize: 50.0,
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return  IngredientScreen(
                            meal: meal['ingredients']['2_persons'],
                            mealname: meal['name'],
                         );
                       },));
                      },
                    ),
                    const Text('Two'),
                  ],
                ),
                // Person Three Button
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.group),
                      iconSize: 50.0,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                         return  IngredientScreen(
                            meal: meal['ingredients']['3_persons'],
                            mealname: meal['name'],
                         );
                       },));
                      },
                    ),
                    const Text('Three'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
