import 'package:emerging_tech/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientScreen extends ConsumerStatefulWidget {
  const IngredientScreen({super.key, required this.meal,required this.mealname});

  final List<dynamic> meal;
  final String mealname;
  @override
  _IngredientScreenState createState() => _IngredientScreenState();
}

class _IngredientScreenState extends ConsumerState<IngredientScreen> {
  late List<dynamic> _meal;

  @override
  void initState() {
    super.initState();
    _meal = List<dynamic>.from(widget.meal); // Create a copy of the original list
  }

  void _removeIngredient(int index) {
    setState(() {
      _meal.removeAt(index);
    });
  }

  void _doubleQuantity(int index) {
    setState(() {
      double currentQuantity = double.parse(_meal[index]['quantity']);
      _meal[index]['quantity'] = (currentQuantity * 2).toString();
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      double currentQuantity = double.parse(_meal[index]['quantity']);
      // Ensure the quantity does not go below zero
      if (currentQuantity > 1) {
        currentQuantity -= 1;
        _meal[index]['quantity'] = currentQuantity.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ingredients for 1 Person',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                itemCount: _meal.length,
                itemBuilder: (context, index) {
                  final ingredient = _meal[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _decreaseQuantity(index);
                            },
                            icon: const Icon(Icons.remove, color: Colors.orange),
                          ),
                          IconButton(
                            onPressed: () {
                              _doubleQuantity(index);
                            },
                            icon: const Icon(Icons.add, color: Colors.green),
                          ),
                          IconButton(
                            onPressed: () {
                              _removeIngredient(index);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                      title: Text(
                        '${ingredient['ingredient']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${ingredient['quantity']} ${ingredient['unit']}',
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                
                ref.watch(dynamicListProvider.notifier).state.add({widget.mealname: widget.meal});
              
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
