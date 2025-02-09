import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;

  const HomeTabBar({super.key, required this.tabController});

  List<Tab> _buildCategories() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: tabController,
      tabs: _buildCategories(),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
