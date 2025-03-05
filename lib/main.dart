import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:food_delivery/providers/delivery_provider.dart';
import 'package:food_delivery/providers/menu_provider.dart';
import 'package:food_delivery/providers/restaurant.dart';
import 'package:food_delivery/pages/login_screen.dart';
import 'package:food_delivery/services/auth/auth_gate.dart';
import 'package:provider/provider.dart';
import 'models/food.dart';
import 'pages/cart_screen.dart';
import 'pages/delivery_progress_screen.dart';
import 'pages/food_details_screen.dart';
import 'pages/home_screen.dart';
import 'pages/payment_screen.dart';
import 'pages/register_screen.dart';
import 'pages/settings_screen.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final themeProvider = ThemeProvider();
  await themeProvider.initializePreferences();

  //debugPaintSizeEnabled = true;
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
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => DeliveryProvider()),
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
            home: AuthGate(),
            routes: {
              HomeScreen.routeName: (ctx) => const HomeScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              RegisterScreen.routeName: (ctx) => RegisterScreen(),
              Settings.routeName: (ctx) => Settings(),
              FoodDetailsScreen.routeName: (ctx) => FoodDetailsScreen(
                    food: ModalRoute.of(ctx)!.settings.arguments as Food,
                  ),
              CartScreen.routeName: (ctx) => CartScreen(),
              PaymentScreen.routeName: (ctx) => PaymentScreen(),
              DeliveryProgressScreen.routeName: (ctx) =>
                  DeliveryProgressScreen(),
            },
          );
        },
      ),
    );
  }
}
