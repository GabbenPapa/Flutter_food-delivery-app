import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';
import '../providers/restaurant.dart';

class FoodDetailsScreen extends StatefulWidget {
  static const routeName = '/food_screen';
  final Food food;

  const FoodDetailsScreen({required this.food, super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  late Map<Addon, bool> selectedAddons = {};

  @override
  void initState() {
    super.initState();
    selectedAddons = {
      for (var addon in widget.food.availableAddons) addon: false,
    };
  }

  void addToCart(Food food, Map<Addon, bool> selectedAddonsMap) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (selectedAddonsMap[addon] ?? false) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<CartProvider>().addToCart(food, currentlySelectedAddons);
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
        children: widget.food.availableAddons.map(
          (addon) {
            return CheckboxListTile(
              checkColor: Theme.of(context).colorScheme.tertiary,
              side: BorderSide(
                  color: Theme.of(context).colorScheme.inversePrimary),
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
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: "food_details_${widget.food.name}",
                  child: Image.asset(
                    widget.food.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 26.0,
                    ),
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
                            onPressed: () => addToCart(
                              widget.food,
                              selectedAddons,
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left: 25, top: 25),
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
      ],
    );
  }
}
