import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';
// import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  static const routeName = '/settings';

  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late String _selectedLanguage = 'English';
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
    // final languageProvider =
    //     Provider.of<LanguageProvider>(context, listen: false);
    // setSelectedLanguage(
    //   languageMap.entries
    //       .firstWhere(
    //           (entry) => entry.value == languageProvider.currentLanguage)
    //       .key,
    // );
  }

  Future<void> _resetIntro() async {
    // await IntroProvider.resetIntroCompleted();
  }

  Future<void> _resetLanguage() async {
    // final languageProvider =
    //     Provider.of<LanguageProvider>(context, listen: false);

    // const defaultLanguageCode = 'en';
    // await languageProvider.setLanguage(defaultLanguageCode);

    // if (!mounted) return;

    // setSelectedLanguage(
    //   languageMap.entries
    //       .firstWhere((entry) => entry.value == defaultLanguageCode)
    //       .key,
    // );
  }

  Future<void> _resetTheme() async {
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    // await themeProvider.resetSettings();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    // final theme = Theme.of(context);
    // final customTheme = theme.extension<CustomThemeExtension>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      // appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language Dropdown
                ListTile(
                  // title: Text(AppLocalizations.of(context)!.language),
                  title: Text(
                    'Language',
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
                      },
                    ),
                  ),
                ),
                const Divider(),

                // Use System Theme Toggle
                SwitchListTile(
                  // title: Text(AppLocalizations.of(context)!.useSystemTheme),
                  title: Text(
                    'Use System Theme',
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
                    'Dark Theme',
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

                const Spacer(),

                // SizedBox(
                //   width: double.infinity,
                //   height: 80,
                //   child: ElevatedButton(
                //     onPressed: () => {
                //       _resetIntro(),
                //       _resetLanguage(),
                //       _resetTheme(),
                //       Navigator.of(context)
                //           .pushReplacementNamed(LauncherScreen.routeName)
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red,
                //     ),
                //     child: Text(
                //       AppLocalizations.of(context)!.factoryReset,
                //       style: const TextStyle(
                //         color: Colors.white,
                //         fontSize: 25,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
