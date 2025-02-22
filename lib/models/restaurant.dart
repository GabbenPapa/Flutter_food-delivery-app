import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Classic burger",
      description:
          "Classic burger with cheese and lettuce, toasted buns and our special sauce on a whole wheat bun",
      imagePath: "assets/images/burgers/ClassicBurger.webp",
      price: 2.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra souse", price: 0.50),
        Addon(name: "Extra cheese", price: 1.0),
        Addon(name: "Extra lettuce", price: 0.50),
        Addon(name: "Extra jalapeno", price: 0.90),
      ],
    ),
    Food(
      name: "Cheese burger",
      description:
          "Cheese burger with cheese and lettuce, toasted buns and our special sauce on a whole wheat bun",
      imagePath: "assets/images/burgers/CheeseBurger.jpeg",
      price: 3.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra souse", price: 0.50),
        Addon(name: "Extra cheese", price: 0.50),
        Addon(name: "Extra jalapeno", price: 0.90),
      ],
    ),
    Food(
      name: "Bacon burger",
      description:
          "Bacon burger and lettuce, the meet and cheese is a whole wheat bun.",
      imagePath: "assets/images/burgers/BaconBurger.jpeg",
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra souse", price: 0.50),
        Addon(name: "Extra cheese", price: 0.50),
        Addon(name: "Extra lettuce", price: 0.50),
      ],
    ),
    Food(
      name: "Vega burger",
      description:
          "Vega burger with lettuce, toasted buns and our special sauce on a whole wheat bun",
      imagePath: "assets/images/burgers/VegaBurger.jpeg",
      price: 3.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra souse", price: 0.50),
        Addon(name: "Extra vegetables", price: 0.50),
        Addon(name: "Extra lettuce", price: 0.50),
      ],
    ),
    Food(
      name: "Ice cream bowl",
      description:
          "It is a giant ice cream bowl with our special toppings, vanilla ice cream, and a whole wheat bun",
      imagePath: "assets/images/desserts/IceCream.jpeg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate syrup", price: 1.0),
      ],
    ),
    Food(
      name: "Waffle",
      description:
          "Fresh and chrunchy waffles with our special chocolate syrup, and fruits.",
      imagePath: "assets/images/desserts/Waffle.jpeg",
      price: 4.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate syrup", price: 1.00),
        Addon(name: "Extra fruits", price: 2.50),
      ],
    ),
    Food(
      name: "Cakes",
      description: "It is a cake selection, with chocolate shake",
      imagePath: "assets/images/desserts/Desserts.webp",
      price: 5.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate syrup", price: 1.0),
      ],
    ),
    Food(
      name: "Lager Beer",
      description: "Teasty lager beer, the original recipe from the 1890s",
      imagePath: "assets/images/drinks/Beer.jpeg",
      price: 2.50,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Coffee",
      description: "Original Italian coffee",
      imagePath: "assets/images/drinks/Coffee.jpeg",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Cold Drinks",
      description:
          "Cold drinks in Fanta, Coke and Sprite, with ice or without ice",
      imagePath: "assets/images/drinks/ColdDrink.jpeg",
      price: 2.00,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Lemonade",
      description:
          "Cold lemonade in maracuja, orange, lemon and lime, with ice or without ice",
      imagePath: "assets/images/drinks/Limonad.jpeg",
      price: 2.00,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Eggs Salad",
      description: "Salad with eggs and lots of vegetables.",
      imagePath: "assets/images/salads/EggsSalad.jpeg",
      price: 2.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
    Food(
      name: "Greek Salad",
      description:
          "Traditional Greek salad with lots of vegetables and olives, feta cheese.",
      imagePath: "assets/images/salads/Greek.jpeg",
      price: 1.89,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
    Food(
      name: "Ham Salad",
      description: "Ham Salad with lots of vegetables, olives and cheese.",
      imagePath: "assets/images/salads/HamSalad.jpeg",
      price: 3.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
    Food(
      name: "Salad",
      description: "Original vegetables salad.",
      imagePath: "assets/images/salads/Salad.webp",
      price: 2.00,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
    Food(
      name: "Wurst Salad",
      description: "Wurst and vegetable mix in the best way",
      imagePath: "assets/images/salads/WurstSalad.jpeg",
      price: 1.89,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
  ];

  String _deliveryAddress = '1164 Budapest, Cinkotai út 12.';

  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

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
        _cart.remove(cartIndex);
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

  String displayCartReceipt() {
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
    receipt.writeln("Delivery address: $_deliveryAddress");

    return receipt.toString();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String _formatPrice(double price) => "\$${price.toStringAsFixed(2)}";

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
