import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text('Cart (${userCart.length})'),
        ),
        body: ListView.builder(
          itemCount: userCart.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.asset(userCart[index].food.imagePath),
            title: Text(userCart[index].food.name),
            subtitle: Text(
                '${userCart[index].quantity} x \$${userCart[index].food.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                restaurant.removeFromCart(userCart[index]);
              },
            ),
          ),
        ),
      );
    });
  }
}
