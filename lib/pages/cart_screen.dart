import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery/generated/l10n.dart';
import '../comonents/cart_tile.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartItem, child) {
        final userCart = cartItem.cart;
        final localizations = AppLocalizations.of(context);

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          appBar: AppBar(
            title: Text('${localizations.cartTitle} (${userCart.length})'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              userCart.isEmpty
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              localizations.clearCartDialogTitle,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  localizations.cancel,
                                ),
                              ),
                              TextButton(
                                onPressed: () => {
                                  cartItem.clearCart(),
                                  Navigator.pop(context),
                                },
                                child: Text(
                                  localizations.yes,
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
                                  localizations.cartIsEmpty,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary,
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
                userCart.isEmpty
                    ? const SizedBox()
                    : SizedBox(
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
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/payment'),
                          child: Text(
                            localizations.checkout,
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
