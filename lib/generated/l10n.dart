// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Cart`
  String get cartTitle {
    return Intl.message('Cart', name: 'cartTitle', desc: '', args: []);
  }

  /// `Cart is empty`
  String get cartIsEmpty {
    return Intl.message(
      'Cart is empty',
      name: 'cartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear the cart?`
  String get clearCartDialogTitle {
    return Intl.message(
      'Are you sure you want to clear the cart?',
      name: 'clearCartDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Delivery Progress`
  String get deliveryProgress {
    return Intl.message(
      'Delivery Progress',
      name: 'deliveryProgress',
      desc: '',
      args: [],
    );
  }

  /// `Add-ons`
  String get addOns {
    return Intl.message('Add-ons', name: 'addOns', desc: '', args: []);
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Ételrendelés`
  String get foodDelivery {
    return Intl.message(
      'Ételrendelés',
      name: 'foodDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get createAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get singUp {
    return Intl.message('Sign Up', name: 'singUp', desc: '', args: []);
  }

  /// `Passwords do not match`
  String get passwordsMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsMatch',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Use System Theme`
  String get useSystemTheme {
    return Intl.message(
      'Use System Theme',
      name: 'useSystemTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message('Dark Theme', name: 'darkTheme', desc: '', args: []);
  }

  /// `Reset Settings`
  String get resetSettings {
    return Intl.message(
      'Reset Settings',
      name: 'resetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Your Location`
  String get yourLocation {
    return Intl.message(
      'Your Location',
      name: 'yourLocation',
      desc: '',
      args: [],
    );
  }

  /// `Add a location`
  String get addLocation {
    return Intl.message(
      'Add a location',
      name: 'addLocation',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Deliver now`
  String get deliverNow {
    return Intl.message('Deliver now', name: 'deliverNow', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Time`
  String get deliveryTime {
    return Intl.message(
      'Delivery Time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `H O M E`
  String get home {
    return Intl.message('H O M E', name: 'home', desc: '', args: []);
  }

  /// `S E T T I N G S`
  String get settingsDrawer {
    return Intl.message(
      'S E T T I N G S',
      name: 'settingsDrawer',
      desc: '',
      args: [],
    );
  }

  /// `L O G O U T`
  String get logOut {
    return Intl.message('L O G O U T', name: 'logOut', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hu'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
