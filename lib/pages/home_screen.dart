import 'package:flutter/material.dart';
import 'package:food_delivery/comonents/current_location.dart';
import 'package:food_delivery/comonents/food_tile.dart';
import 'package:food_delivery/comonents/tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/providers/menu_provider.dart';
import 'package:provider/provider.dart';

import '../comonents/description_box.dart';
import '../comonents/drawer.dart';
import '../comonents/sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Provider.of<MenuProvider>(context, listen: false).fetchMenu();

    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodItemInCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return FoodTile(
            food: categoryMenu[index],
            onTap: () => Navigator.pushNamed(
              context,
              '/food_screen',
              arguments: categoryMenu[index],
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          HomeSliverAppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
                CurrentLocation(),
                HomeDicriptionBox(),
                HomeTabBar(tabController: _tabController)
              ],
            ),
            child: Container(),
          )
        ],
        body: Consumer<MenuProvider>(
          builder: (context, menuProvider, child) {
            final menu = menuProvider.menu;

            if (menu.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return TabBarView(
              controller: _tabController,
              children: getFoodItemInCategory(menu),
            );
          },
        ),
      ),
    );
  }
}
