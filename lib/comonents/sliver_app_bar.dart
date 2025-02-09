import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const HomeSliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      collapsedHeight: 200,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      iconTheme:
          IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      title: Center(
        child: Text(
          'BoBurger',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.all(16.0),
        background: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: child,
        ),
      ),
    );
  }
}
