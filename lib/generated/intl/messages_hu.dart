// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hu';

  static String m0(param) => "Kartya tulajdonos: ${param}";

  static String m1(param) => "Kartya szám: ${param}";

  static String m2(param) => "Lejérés időpont: ${param}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addLocation": MessageLookupByLibrary.simpleMessage("Helyszín hozzáadása"),
    "addOns": MessageLookupByLibrary.simpleMessage("Kiegészítők"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Kosárba"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Már van felhasználó?",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Mégse"),
    "cardHolderName": m0,
    "cardHolderName2": MessageLookupByLibrary.simpleMessage("Kártyatulajdonos"),
    "cardHolderNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Kérjük, adja meg a kártyatulajdonos nevét",
    ),
    "cardNum": m1,
    "cardNumber": MessageLookupByLibrary.simpleMessage("Kártyaszám"),
    "cardNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "Kérjük, adja meg a kártyaszámot",
    ),
    "cardNumberInvalid": MessageLookupByLibrary.simpleMessage(
      "A kártyaszámnak pontosan 16 számból kell állnia",
    ),
    "cartIsEmpty": MessageLookupByLibrary.simpleMessage("A kosár üres"),
    "cartTitle": MessageLookupByLibrary.simpleMessage("Kosár"),
    "checkout": MessageLookupByLibrary.simpleMessage("Pénztár"),
    "clearCartDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Biztosan törölni szeretné a kosarat?",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Megerősítés"),
    "confirmPayment": MessageLookupByLibrary.simpleMessage(
      "Fizetés megerősítése",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage(
      "Nincs felhasználód?",
    ),
    "cvv": MessageLookupByLibrary.simpleMessage("CVV"),
    "cvvEmpty": MessageLookupByLibrary.simpleMessage(
      "Kérjük, adja meg a CVV-t",
    ),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Sötét téma"),
    "deliverNow": MessageLookupByLibrary.simpleMessage("Azonnali szállítás"),
    "deliveryFee": MessageLookupByLibrary.simpleMessage("Szállítási díj"),
    "deliveryProgress": MessageLookupByLibrary.simpleMessage(
      "Szállítás állapota",
    ),
    "deliveryTime": MessageLookupByLibrary.simpleMessage("Szállítási idő"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "error": MessageLookupByLibrary.simpleMessage("Hiba"),
    "estimatedDeliveryTime": MessageLookupByLibrary.simpleMessage(
      "Várható szállítási idő: 30 perc",
    ),
    "expiryDate": m2,
    "expiryDate2": MessageLookupByLibrary.simpleMessage("Lejérés dátum"),
    "expiryDateCardExpired": MessageLookupByLibrary.simpleMessage(
      "Lejárt kártya",
    ),
    "expiryDateEmpty": MessageLookupByLibrary.simpleMessage(
      "Kérjük, adja meg a lejárati dátumot",
    ),
    "expiryDateInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Érvénytelen formátum (HH/ÉÉ)",
    ),
    "expiryDateInvalidMonth": MessageLookupByLibrary.simpleMessage(
      "Érvénytelen hónap (01-12)",
    ),
    "foodDelivery": MessageLookupByLibrary.simpleMessage("Ételrendelés"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password"),
    "home": MessageLookupByLibrary.simpleMessage("H O M E"),
    "invalidCardNumber": MessageLookupByLibrary.simpleMessage(
      "Érvénytelen kártyaszám",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Nyelv"),
    "logOut": MessageLookupByLibrary.simpleMessage("K I L É P É S"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordsMatch": MessageLookupByLibrary.simpleMessage(
      "A jelszavak nem egyeznek",
    ),
    "payNow": MessageLookupByLibrary.simpleMessage("Fizetés"),
    "register": MessageLookupByLibrary.simpleMessage("Regisztrálok"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Sikeres regisztráció",
    ),
    "resetSettings": MessageLookupByLibrary.simpleMessage(
      "Beállítások visszaállítása",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Mentés"),
    "settings": MessageLookupByLibrary.simpleMessage("Beállítások"),
    "settingsDrawer": MessageLookupByLibrary.simpleMessage("B E Á L L Í T Á S"),
    "signIn": MessageLookupByLibrary.simpleMessage("Bejelentkezés"),
    "singUp": MessageLookupByLibrary.simpleMessage("Regisztráció"),
    "success": MessageLookupByLibrary.simpleMessage("Sikeres"),
    "thankYouForYourOrder": MessageLookupByLibrary.simpleMessage(
      "Köszönjük a rendelését",
    ),
    "useSystemTheme": MessageLookupByLibrary.simpleMessage(
      "Rendszer témájának használata",
    ),
    "yes": MessageLookupByLibrary.simpleMessage("Igen"),
    "yourLocation": MessageLookupByLibrary.simpleMessage("Az Ön helyzete"),
    "yourName": MessageLookupByLibrary.simpleMessage("Az Ön neve"),
  };
}
