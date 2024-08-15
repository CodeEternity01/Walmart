import 'package:emerging_tech/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartMeals = ref.watch(dynamicListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cartMeals.length,
        itemBuilder: (context, listIndex) {
          final mealMap = cartMeals[listIndex];
          final mealName = mealMap.keys.first; // Get the meal name
          final ingredients = mealMap[mealName] ?? []; // Get the list of ingredients for the meal

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mealName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // Prevents ListView from expanding infinitely
                itemCount: ingredients.length,
                itemBuilder: (context, ingredientIndex) {
                  final ingredient = ingredients[ingredientIndex];
                  return ListTile(
                    title: Text(ingredient['ingredient']),
                    subtitle: Text('${ingredient['quantity']} ${ingredient['unit']}'),
                  );
                },
              ),

            ],
          );
        },
      ),

     floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width*0.25,
       child: FloatingActionButton(
        
          onPressed: () {
            // Add your checkout logic here
          },
          backgroundColor: Colors.blue,
          child: const Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ), // Customize as needed
        ),
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    
    );
  }
}
