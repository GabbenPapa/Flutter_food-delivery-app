import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodDetailsScreen extends StatefulWidget {
  static const routeName = '/food_screen';
  final Food food;

  const FoodDetailsScreen({required this.food, super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late Map<Addon, bool> selectedAddons;

  @override
  void initState() {
    super.initState();
    selectedAddons = {
      for (var addon in widget.food.availableAddons) addon: false,
    };
  }

  Widget _buildAddOnsSection(BuildContext context) {
    if (widget.food.availableAddons.isEmpty) return const SizedBox.shrink();

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          'Add-ons',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        children: widget.food.availableAddons.map((addon) {
          return CheckboxListTile(
            title: Text(
              addon.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            subtitle: Text(
              '\$${addon.price}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            value: selectedAddons[addon] ?? false,
            onChanged: (bool? value) {
              setState(() {
                selectedAddons[addon] = value ?? false;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.food.imagePath),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                        Text(
                          '\$${widget.food.price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        _buildAddOnsSection(context),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 25),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                            onPressed: () {
                              if (kDebugMode) {
                                print('Add to Cart');
                              }
                            },
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Vissza gomb
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
