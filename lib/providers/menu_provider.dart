import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:http/http.dart' as http;

class MenuProvider with ChangeNotifier {
  List<Food> _menuItems = [];

  Future<void> fetchMenu() async {
    const url =
        'https://food-delivery-72100-default-rtdb.europe-west1.firebasedatabase.app/menu.json';
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Food> loadedMenu = [];
      extractedData.forEach((foodId, foodData) {
        loadedMenu.add(Food(
          id: foodId,
          name: foodData['name'],
          description: foodData['description'],
          price: foodData['price'],
          category: FoodCategory.values.firstWhere(
              (element) => element.toString() == foodData['category']),
          availableAddons: (foodData['availableAddons'] as List<dynamic>)
              .map((addon) => Addon(
                    name: addon['name'],
                    price: addon['price'],
                  ))
              .toList(),
          imagePath: foodData['imagePath'],
          //imageUrl: foodData['imageUrl'],
        ));
      });
    } catch (error) {
      print(error);
    }
  }

  List<Food> get menuItems => _menuItems;

  void setMenuItems(List<Food> menuItems) {
    _menuItems = menuItems;
    notifyListeners();
  }
}
