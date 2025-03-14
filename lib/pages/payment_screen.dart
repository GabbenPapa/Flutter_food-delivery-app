import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, LengthLimitingTextInputFormatter;
import 'package:food_delivery/formatter/formatter.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:u_credit_card/u_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  void startPaymentAction() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context).confirmPayment,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  AppLocalizations.of(context).cardNum(cardNumber),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).expiryDate(expiryDate),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).cardHolderName(cardHolderName),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context).cancel,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/delivery_progress');
              },
              child: Text(
                AppLocalizations.of(context).confirm,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          localization.checkout,
        ),
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          bottom: 26.0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CreditCardUi(
                width: MediaQuery.of(context).size.width * 0.9,
                cardHolderFullName: cardHolderName.isEmpty
                    ? AppLocalizations.of(context).yourName
                    : cardHolderName,
                cardNumber:
                    cardNumber.isEmpty ? 'XXXX XXXX XXXX XXXX' : cardNumber,
                validFrom: expiryDate.isEmpty ? 'MM/YY' : expiryDate,
                validThru: expiryDate.isEmpty ? 'MM/YY' : expiryDate,
                topLeftColor: Colors.blue,
                doesSupportNfc: false,
                placeNfcIconAtTheEnd: false,
                cardType: CardType.debit,
                cardProviderLogo: const FlutterLogo(size: 40),
                cardProviderLogoPosition: CardProviderLogoPosition.right,
                showBalance: false,
                balance: 0.0,
                autoHideBalance: true,
                enableFlipping: false,
                cvvNumber: cvvCode,
              ),
              const SizedBox(height: 20),
              _cardNumberField(),
              const SizedBox(height: 16),
              _expiryDateField(),
              const SizedBox(height: 16),
              _cardHolderNameField(),
              const SizedBox(height: 16),
              _cvvField(),
              const SizedBox(height: 20),
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
                  onPressed: startPaymentAction,
                  child: Text(
                    localization.payNow,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardNumberField() {
    final localization = AppLocalizations.of(context);
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: localization.cardNumber,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberFormatter(),
      ],
      onChanged: (value) => setState(() => cardNumber = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).cardNumberEmpty;
        }
        final cleanedValue = value.replaceAll(' ', '');
        if (cleanedValue.length != 16) {
          return AppLocalizations.of(context).cardNumberInvalid;
        }
        if (!RegExp(r'^\d{16}$').hasMatch(cleanedValue)) {
          return AppLocalizations.of(context).invalidCardNumber;
        }
        return null;
      },
    );
  }

  Widget _expiryDateField() {
    final localization = AppLocalizations.of(context);
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: localization.expiryDate2,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: const OutlineInputBorder(),
        hintText: 'MM/YY',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        ExpiryDateFormatter(),
      ],
      onChanged: (value) => setState(() => expiryDate = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).expiryDateEmpty;
        }
        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
          return AppLocalizations.of(context).expiryDateInvalidFormat;
        }

        final month = int.tryParse(value.substring(0, 2)) ?? 0;
        final year = int.tryParse(value.substring(3, 5)) ?? 0;
        if (month < 1 || month > 12) {
          return AppLocalizations.of(context).expiryDateInvalidMonth;
        }
        final now = DateTime.now();
        final currentYear = now.year % 100;
        final currentMonth = now.month;
        if (year < currentYear ||
            (year == currentYear && month < currentMonth)) {
          return AppLocalizations.of(context).expiryDateCardExpired;
        }
        return null;
      },
    );
  }

  Widget _cardHolderNameField() {
    final localization = AppLocalizations.of(context);
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: localization.cardHolderName2,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) => setState(() => cardHolderName = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).cardHolderNameEmpty;
        }
        return null;
      },
    );
  }

  Widget _cvvField() {
    final localization = AppLocalizations.of(context);
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: localization.cvv,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      obscureText: true,
      onChanged: (value) => setState(() => cvvCode = value),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).cvvEmpty;
        }
        return null;
      },
    );
  }
}
