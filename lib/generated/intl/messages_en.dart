// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(param) => "Card Holder Name: ${param}";

  static String m1(param) => "Card Number: ${param}";

  static String m2(param) => "Expiry Date: ${param}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "addLocation": MessageLookupByLibrary.simpleMessage("Add a location"),
    "addOns": MessageLookupByLibrary.simpleMessage("Add-ons"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cardHolderName": m0,
    "cardHolderName2": MessageLookupByLibrary.simpleMessage("Card Holder Name"),
    "cardHolderNameEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter card holder name",
    ),
    "cardNum": m1,
    "cardNumber": MessageLookupByLibrary.simpleMessage("Card Number"),
    "cardNumberEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter card number",
    ),
    "cardNumberInvalid": MessageLookupByLibrary.simpleMessage(
      "Card number must be exactly 16 digits",
    ),
    "cartIsEmpty": MessageLookupByLibrary.simpleMessage("Cart is empty"),
    "cartTitle": MessageLookupByLibrary.simpleMessage("Cart"),
    "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
    "clearCartDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear the cart?",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPayment": MessageLookupByLibrary.simpleMessage("Confirm Payment"),
    "createAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "cvv": MessageLookupByLibrary.simpleMessage("CVV"),
    "cvvEmpty": MessageLookupByLibrary.simpleMessage("Please enter CVV"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
    "deliverNow": MessageLookupByLibrary.simpleMessage("Deliver now"),
    "deliveryFee": MessageLookupByLibrary.simpleMessage("Delivery Fee"),
    "deliveryProgress": MessageLookupByLibrary.simpleMessage(
      "Delivery Progress",
    ),
    "deliveryTime": MessageLookupByLibrary.simpleMessage("Delivery Time"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "estimatedDeliveryTime": MessageLookupByLibrary.simpleMessage(
      "Estimated Delivery Time: 30 minutes",
    ),
    "expiryDate": m2,
    "expiryDate2": MessageLookupByLibrary.simpleMessage("Expiry Date"),
    "expiryDateCardExpired": MessageLookupByLibrary.simpleMessage(
      "Card expired",
    ),
    "expiryDateEmpty": MessageLookupByLibrary.simpleMessage(
      "Please enter expiry date",
    ),
    "expiryDateInvalidFormat": MessageLookupByLibrary.simpleMessage(
      "Invalid format (MM/YY)",
    ),
    "expiryDateInvalidMonth": MessageLookupByLibrary.simpleMessage(
      "Invalid month (01-12)",
    ),
    "foodDelivery": MessageLookupByLibrary.simpleMessage("Ételrendelés"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password"),
    "home": MessageLookupByLibrary.simpleMessage("H O M E"),
    "invalidCardNumber": MessageLookupByLibrary.simpleMessage(
      "Invalid card number",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "logOut": MessageLookupByLibrary.simpleMessage("L O G O U T"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordsMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "payNow": MessageLookupByLibrary.simpleMessage("Pay Now"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Registration Successful",
    ),
    "resetSettings": MessageLookupByLibrary.simpleMessage("Reset Settings"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsDrawer": MessageLookupByLibrary.simpleMessage("S E T T I N G S"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "singUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "success": MessageLookupByLibrary.simpleMessage("Successful"),
    "thankYouForYourOrder": MessageLookupByLibrary.simpleMessage(
      "Thank you for your order",
    ),
    "useSystemTheme": MessageLookupByLibrary.simpleMessage("Use System Theme"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "yourLocation": MessageLookupByLibrary.simpleMessage("Your Location"),
    "yourName": MessageLookupByLibrary.simpleMessage("Your Name"),
  };
}
