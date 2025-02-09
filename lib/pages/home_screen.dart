import 'package:flutter/material.dart';
import 'package:food_delivery/comonents/current_location.dart';
import 'package:food_delivery/comonents/tab_bar.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            child: Container(
                // Itt jön a háttérben lévő child tartalom
                ),
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Text("1"),
            Text("2"),
            Text("3"),
          ],
        ),
      ),
    );
  }
}
