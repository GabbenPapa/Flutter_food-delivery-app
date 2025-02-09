import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;

  const HomeTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: tabController,
      tabs: [
        Tab(
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 20,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 20,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.person,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 20,
          ),
        ),
      ],
    );
  }
}
