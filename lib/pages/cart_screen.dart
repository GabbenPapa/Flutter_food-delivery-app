import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../comonents/cart_tile.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartItem, child) {
        final userCart = cartItem.cart;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          appBar: AppBar(
            title: Text('Cart (${userCart.length})'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Are you sure you want to clear the cart?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            "Cancel",
                          ),
                        ),
                        TextButton(
                          onPressed: () => {
                            cartItem.clearCart(),
                            Navigator.pop(context),
                          },
                          child: const Text(
                            "Yes",
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: 26.0,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      userCart.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  "Cart is empty",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  final cartItem = userCart[index];

                                  return CartTile(
                                    cartItem: cartItem,
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 25),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/payment'),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
