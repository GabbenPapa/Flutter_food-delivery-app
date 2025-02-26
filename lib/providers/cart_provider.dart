import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/providers/delivery_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  List<CartItem> get cart => _cart;
  final List<CartItem> _cart = [];

//Providerbe vele!
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String _formatPrice(double price) => "\$${price.toStringAsFixed(2)}";

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }

  String displayCartReceipt(context) {
    final restaurant = Provider.of<DeliveryProvider>(context, listen: false);
    final address = restaurant.deliveryAddress;

    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();

    receipt.writeln("----------------");

    for (CartItem cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
    }
    receipt.writeln("----------------");
    receipt.writeln();

    receipt.writeln("Total: ${_formatPrice(getTotalPrice())}");

    receipt.writeln();
    receipt.writeln("Delivery address: $address");

    return receipt.toString();
  }
}
