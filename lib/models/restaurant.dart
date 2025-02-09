import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: "Classic burger",
      description:
          "Classic burger with cheese and lettuce, toasted buns and our special sauce on a whole wheat bun",
      imagePath: "assetsimages\burgersClassicBurger.webp",
      price: 1.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra souse", price: 0.50),
        Addon(name: "Extra cheese", price: 0.50)
      ],
    ),
    Food(
      name: "Ice cream bowl",
      description:
          "It is a giant ice cream bowl with our special toppings, vanilla ice cream, and a whole wheat bun",
      imagePath: "assetsimagesdessertsIceCream.jpeg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate syrup", price: 1.0),
      ],
    ),
    Food(
      name: "Lager Beer",
      description: "Teasty lager beer, the original recipe from the 1890s",
      imagePath: "assetsimagesdrinksBeer.jpeg",
      price: 2.50,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: "Greek Salad",
      description:
          "It is a giant ice cream bowl with our special toppings, vanilla ice cream, and a whole wheat bun",
      imagePath: "assetsimagessaladsGreek.jpeg",
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
