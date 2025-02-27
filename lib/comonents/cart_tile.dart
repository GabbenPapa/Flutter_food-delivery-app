import 'package:flutter/material.dart';
import 'package:food_delivery/comonents/quantity_selector.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.food.name),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeFromCart(cartItem);
      },
      child: Consumer<CartProvider>(
        builder: (context, cart, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${cartItem.food.price}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        QuantitySelector(
                          qantity: cartItem.quantity,
                          food: cartItem.food,
                          onDecrement: () {
                            cart.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            cart.addToCart(
                                cartItem.food, cartItem.selectedAddons);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: cartItem.selectedAddons.isNotEmpty ? 60 : 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: cartItem.selectedAddons.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final addon = cartItem.selectedAddons[index];
                      return FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(addon.name),
                            const SizedBox(width: 5),
                            Text("\$${addon.price.toString()}"),
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        onSelected: (value) {},
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
