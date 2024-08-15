import 'dart:convert';
import 'package:emerging_tech/screens/select_screen.dart';
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
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMeals();
  }

  Future<void> _loadMeals() async {
    final String response = await rootBundle.loadString('assets/data/meals.json');
    final data = json.decode(response);
    setState(() {
      meals = data['meals'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Filter meals based on selected category and search query
    final filteredMeals = meals.where((meal) {
      final matchesCategory = selectedcategory == null || meal['category'] == selectedcategory;
      final matchesSearch = meal['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: meals.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Veg Button
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
                        // Non Veg Button
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
                        ),
                        // Search Box
                        Expanded(
                          
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                labelText: 'Search',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  searchQuery = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Meals Grid
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.72,
                    child: GridView.builder(
                      itemCount: filteredMeals.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final meal = filteredMeals[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context) {
                                    return  SelectScreen(meal: meal,);
                              },));
                            },
                            child: MealItem(
                              name: meal['name'],
                              imageUrl: meal['image_url'],
                              type: meal['category'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
