import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Restaurant extends ChangeNotifier {
  Future<void> uploadMenu() async {
    final url = Uri.parse(
        'https://food-delivery-72100-default-rtdb.europe-west1.firebasedatabase.app/menu.json');

    final List<Map<String, dynamic>> menu = [
      {
        "name": "Classic burger",
        "description":
            "Classic burger with cheese and lettuce, toasted buns and our special sauce on a whole wheat bun",
        "imagePath": "assets/images/burgers/ClassicBurger.webp",
        "price": 2.99,
        "category": "burgers",
        "availableAddons": [
          {"name": "Extra souse", "price": 0.50},
          {"name": "Extra cheese", "price": 1.0},
          {"name": "Extra lettuce", "price": 0.50},
          {"name": "Extra jalapeno", "price": 0.90}
        ]
      },
      {
        "name": "Cheese burger",
        "description":
            "Cheese burger with cheese and lettuce, toasted buns and our special sauce on a whole wheat bun",
        "imagePath": "assets/images/burgers/CheeseBurger.jpeg",
        "price": 3.50,
        "category": "burgers",
        "availableAddons": [
          {"name": "Extra souse", "price": 0.50},
          {"name": "Extra cheese", "price": 0.50},
          {"name": "Extra jalapeno", "price": 0.90}
        ]
      },
      {
        "name": "Bacon burger",
        "description":
            "Bacon burger and lettuce, the meet and cheese is a whole wheat bun.",
        "imagePath": "assets/images/burgers/BaconBurger.jpeg",
        "price": 1.99,
        "category": "burgers",
        "availableAddons": [
          {"name": "Extra souse", "price": 0.50},
          {"name": "Extra cheese", "price": 0.50},
          {"name": "Extra lettuce", "price": 0.50}
        ]
      },
      {
        "name": "Burger attack",
        "description":
            "If you are really hungry, this is the burger for you. Burgers with lettuce, toasted buns and our special sauce on a whole wheat bun",
        "imagePath": "assets/images/burgers/ThreeBurgers.jpeg",
        "price": 3.99,
        "category": "burgers",
        "availableAddons": [
          {"name": "Extra souse", "price": 0.50},
          {"name": "Fries", "price": 2.50},
          {"name": "Extra lettuce", "price": 0.50}
        ]
      },
      {
        "name": "Vega burger",
        "description":
            "Vega burger with lettuce, toasted buns and our special sauce on a whole wheat bun",
        "imagePath": "assets/images/burgers/VegaBurger.jpeg",
        "price": 3.99,
        "category": "burgers",
        "availableAddons": [
          {"name": "Extra souse", "price": 0.50},
          {"name": "Extra vegetables", "price": 0.50},
          {"name": "Extra lettuce", "price": 0.50}
        ]
      },
      {
        "name": "Ice cream bowl",
        "description":
            "It is a giant ice cream bowl with our special toppings, vanilla ice cream, and a whole wheat bun",
        "imagePath": "assets/images/desserts/IceCream.jpeg",
        "price": 2.99,
        "category": "desserts",
        "availableAddons": [
          {"name": "Extra chocolate syrup", "price": 1.0}
        ]
      },
      {
        "name": "Waffle",
        "description":
            "Fresh and crunchy waffles with our special chocolate syrup, and fruits.",
        "imagePath": "assets/images/desserts/Waffle.jpeg",
        "price": 4.99,
        "category": "desserts",
        "availableAddons": [
          {"name": "Extra chocolate syrup", "price": 1.00},
          {"name": "Extra fruits", "price": 2.50}
        ]
      },
      {
        "name": "Cakes",
        "description": "It is a cake selection, with chocolate shake",
        "imagePath": "assets/images/desserts/Desserts.webp",
        "price": 5.50,
        "category": "desserts",
        "availableAddons": [
          {"name": "Extra chocolate syrup", "price": 1.0}
        ]
      },
      {
        "name": "Lager Beer",
        "description": "Tasty lager beer, the original recipe from the 1890s",
        "imagePath": "assets/images/drinks/Beer.jpeg",
        "price": 2.50,
        "category": "drinks",
        "availableAddons": null
      },
      {
        "name": "Coffee",
        "description": "Original Italian coffee",
        "imagePath": "assets/images/drinks/Coffee.jpeg",
        "price": 1.50,
        "category": "drinks",
        "availableAddons": [
          {"name": "Extra chocolate syrup"}
        ]
      },
      {
        "name": "Cold Drinks",
        "description":
            "Cold drinks in Fanta, Coke and Sprite, with ice or without ice",
        "imagePath": "assets/images/drinks/ColdDrink.jpeg",
        "price": 2.00,
        "category": "drinks",
        "availableAddons": []
      },
      {
        "name": "Lemonade",
        "description":
            "Cold lemonade in maracuja, orange, lemon and lime, with ice or without ice",
        "imagePath": "assets/images/drinks/Limonad.jpeg",
        "price": 2.00,
        "category": "drinks",
        "availableAddons": []
      },
      {
        "name": "Eggs Salad",
        "description": "Salad with eggs and lots of vegetables.",
        "imagePath": "assets/images/salads/EggsSalad.jpeg",
        "price": 2.50,
        "category": "salads",
        "availableAddons": [
          {"name": "Extra olives", "price": 0.50}
        ]
      },
      {
        "name": "Greek Salad",
        "description":
            "Traditional Greek salad with lots of vegetables and olives, feta cheese.",
        "imagePath": "assets/images/salads/Greek.jpeg",
        "price": 1.89,
        "category": "salads",
        "availableAddons": [
          {"name": "Extra olives", "price": 0.50}
        ]
      },
      {
        "name": "Wurst Salad",
        "description": "Wurst and vegetable mix in the best way",
        "imagePath": "assets/images/salads/WurstSalad.jpeg",
        "price": 1.89,
        "category": "salads",
        "availableAddons": [
          {"name": "Extra olives", "price": 0.50}
        ]
      },
      {
        "name": "Onion Rings",
        "description": "Golden and crispy onion rings perfect for dipping.",
        "imagePath": "assets/images/sides/OnionRings.webp",
        "price": 3.99,
        "category": "sides",
        "availableAddons": []
      },
      {
        "name": "Garlic Bread",
        "description":
            "Warm and toasty garlic bread topped with melted butter and parsley.",
        "imagePath": "assets/images/sides/GarlicBread.webp",
        "price": 2.99,
        "category": "sides",
        "availableAddons": []
      }
    ];

    try {
      for (var item in menu) {
        final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(item),
        );
        //Todo Error handling
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (kDebugMode) {
            print("${item['name']} Push successful!");
          }
        } else {
          if (kDebugMode) {
            print("Error (${item['name']}): ${response.body}");
          }
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print("Network error: $error");
      }
    }
  }
}
