import 'package:flutter/material.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:provider/provider.dart';

import 'pages/home_screen.dart';
import 'pages/register_screen.dart';
import 'pages/settings_screen.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegisterScreen.routeName: (ctx) => RegisterScreen(),
        Settings.routeName: (ctx) => Settings(),
      },
    );
  }
}
