import 'package:flutter/material.dart';

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
          "Bacon burger, and lettuce, the meet and cheese is a whole wheat bun.",
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
      name: "Greek Salad",
      description:
          "It is a giant ice cream bowl with our special toppings, vanilla ice cream, and a whole wheat bun",
      imagePath: "assets/images/salads/Greek.jpeg",
      price: 1.89,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra olives", price: 0.50),
      ],
    ),
  ];

  //getter
  List<Food> get menu => _menu;
}
