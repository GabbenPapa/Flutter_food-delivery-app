import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:food_delivery/models/food.dart';
import 'package:http/http.dart' as http;

class MenuProvider with ChangeNotifier {
  List<Food> _menu = [];

  List<Food> get menu => _menu;

  Future<void> fetchMenu() async {
    const url =
        'https://food-delivery-72100-default-rtdb.europe-west1.firebasedatabase.app/menu.json';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.body == "null") {
        if (kDebugMode) {
          print("There is no data on the server!");
        }
        return;
      }
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Food> loadedMenu = [];
      extractedData.forEach((foodId, foodData) {
        try {
          loadedMenu.add(Food(
            id: foodId,
            name: foodData['name'],
            description: foodData['description'],
            price: foodData['price'],

            category: FoodCategory.values.firstWhere((element) =>
                element.toString() == "FoodCategory.${foodData['category']}"),
            availableAddons: foodData['availableAddons'] != null
                ? (foodData['availableAddons'] as List<dynamic>)
                    .map((addon) => Addon(
                          name: addon['name'],
                          price: (addon['price'] as num).toDouble(),
                        ))
                    .toList()
                : [],

            imagePath: foodData['imagePath'],
            //imageUrl: foodData['imageUrl'],
          ));
        } catch (error) {
          if (kDebugMode) {
            print(error);
          }
        }
      });
      _menu = loadedMenu;
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
