import 'package:flutter/material.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'pages/home_screen.dart';
import 'pages/register_screen.dart';
import 'pages/settings_screen.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.initializePreferences();

  runApp(MyApp(themeProvider));
}

class MyApp extends StatelessWidget {
  final ThemeProvider themeProvider;

  const MyApp(this.themeProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.useSystemTheme
                ? ThemeMode.system
                : themeProvider.isDarkTheme
                    ? ThemeMode.dark
                    : ThemeMode.light,
            home: HomeScreen(),
            routes: {
              HomeScreen.routeName: (ctx) => const HomeScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              RegisterScreen.routeName: (ctx) => RegisterScreen(),
              Settings.routeName: (ctx) => Settings(),
            },
          );
        },
      ),
    );
  }
}
