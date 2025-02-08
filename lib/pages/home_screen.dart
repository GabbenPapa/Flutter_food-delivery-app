import 'package:flutter/material.dart';

import '../comonents/drawer.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: HomeDrawer(),
    );
  }
}
