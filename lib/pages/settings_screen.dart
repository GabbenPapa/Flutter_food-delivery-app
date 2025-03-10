import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/pages/home_screen.dart';
import 'package:food_delivery/providers/restaurant.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String _selectedLanguage = 'English';
  var isServiceMode = false;
  int serviceModeTapCounter = 0;
  final Map<String, String> languageMap = {
    'English': 'en',
    'Hungarian': 'hu',
  };

  void setSelectedLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    setSelectedLanguage(
      languageMap.entries
          .firstWhere(
              (entry) => entry.value == languageProvider.locale.languageCode)
          .key,
    );
  }

  @override
  void dispose() {
    isServiceMode = false;
    super.dispose();
  }

  void serviceMode() {
    setState(() {
      serviceModeTapCounter++;

      if (serviceModeTapCounter >= 4) {
        isServiceMode = !isServiceMode;
        serviceModeTapCounter = 0;
      }
    });
  }

  Future<void> _resetIntro() async {
    // await IntroProvider.resetIntroCompleted();
  }

  Future<void> _resetLanguage() async {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);

    const defaultLanguageCode = 'en';
    await languageProvider.setLocale(defaultLanguageCode);

    if (!mounted) return;

    setSelectedLanguage(
      languageMap.entries
          .firstWhere((entry) => entry.value == defaultLanguageCode)
          .key,
    );
  }

  Future<void> _resetTheme() async {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    // await themeProvider.resetSettings();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        title: Text(localizations.settings),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: 26.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language Dropdown
                ListTile(
                  title: Text(
                    localizations.language,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedLanguage,
                      dropdownColor: Theme.of(context).colorScheme.onSurface,
                      items: languageMap.keys
                          .map((lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary)),
                              ))
                          .toList(),
                      onChanged: (newLang) {
                        if (newLang == null) return;
                        setSelectedLanguage(newLang);
                        final languageProvider = Provider.of<LanguageProvider>(
                            context,
                            listen: false);
                        languageProvider.setLocale(languageMap[newLang]!);
                      },
                    ),
                  ),
                ),
                const Divider(),

                // Use System Theme Toggle
                SwitchListTile(
                  title: Text(
                    localizations.useSystemTheme,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  value: Provider.of<ThemeProvider>(context).useSystemTheme,
                  onChanged: (value) async {
                    await Provider.of<ThemeProvider>(context, listen: false)
                        .setUseSystemTheme(value);
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                ),

                // Dark Theme Toggle
                SwitchListTile(
                  title: Text(
                    localizations.darkTheme,
                    style: TextStyle(
                      color: Provider.of<ThemeProvider>(context).useSystemTheme
                          ? Theme.of(context).disabledColor
                          : Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.onSurface,
                  value: Provider.of<ThemeProvider>(context).isDarkTheme,
                  onChanged: (bool value) {
                    if (Provider.of<ThemeProvider>(context, listen: false)
                        .useSystemTheme) {
                      return;
                    }
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setIsDarkTheme(value);
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                  activeTrackColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 60),
                  builder: (context, double value, child) {
                    return Transform.rotate(
                      angle: value * 2 * pi,
                      child: child,
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => (serviceMode()),
                              child: Icon(
                                Icons.settings,
                                size: 100,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),
                if (isServiceMode)
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 25),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                      onPressed: () {
                        Provider.of<Restaurant>(context, listen: false)
                            .uploadMenu();
                      },
                      child: const Text(
                        "Push to db",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => {
                      _resetIntro(),
                      _resetLanguage(),
                      _resetTheme(),
                      Navigator.of(context)
                          .pushReplacementNamed(HomeScreen.routeName)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      localizations.resetSettings,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
