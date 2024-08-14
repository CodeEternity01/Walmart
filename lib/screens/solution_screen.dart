import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for rootBundle
import 'package:emerging_tech/widgets/meal_item.dart';
import 'package:flutter/widgets.dart';

class SolutionScreen extends StatefulWidget {
  const SolutionScreen({super.key});

  @override
  _SolutionScreenState createState() => _SolutionScreenState();
}

class _SolutionScreenState extends State<SolutionScreen> {
  List<dynamic> meals = [];
  String? selectedcategory;

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final String response =
        await rootBundle.loadString('assets/data/meals.json');
    final data = json.decode(response);
    setState(() {
      meals = data['meals'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter meals based on selected category
    final filteredMeals = selectedcategory == null
        ? meals
        : meals.where((meal) => meal['category'] == selectedcategory).toList();

    return Scaffold(
      body: meals.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedcategory = selectedcategory == 'Vegetarian' ? null : 'Vegetarian';
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedcategory == 'Vegetarian'
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('Veg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedcategory = selectedcategory == 'Non-Vegetarian' ? null : 'Non-Vegetarian';
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedcategory == 'Non-Vegetarian'
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 2),
                                borderRadius: BorderRadius.circular(16)),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 6, right: 6),
                                child: Text('Non Veg'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.builder(
                    itemCount: filteredMeals.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final meal = filteredMeals[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MealItem(
                          name: meal['name'],
                          imageUrl: meal['image_url'],
                          type: meal['category'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
