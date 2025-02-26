import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, LengthLimitingTextInputFormatter;
import 'package:food_delivery/formatter/formatter.dart';
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
            "Confirm Payment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Card Number: $cardNumber",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Expiry Date: $expiryDate",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                Text(
                  "Card Holder Name: $cardHolderName",
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
                "Cancel",
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
                "Confirm",
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
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
                cardHolderFullName:
                    cardHolderName.isEmpty ? 'Your Name' : cardHolderName,
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
                    "Pay Now",
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
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Card Number',
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
          return 'Please enter card number';
        }
        final cleanedValue = value.replaceAll(' ', '');
        if (cleanedValue.length != 16) {
          return 'Card number must be exactly 16 digits';
        }
        if (!RegExp(r'^\d{16}$').hasMatch(cleanedValue)) {
          return 'Invalid card number';
        }
        return null;
      },
    );
  }

  Widget _expiryDateField() {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Expiry Date',
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
          return 'Please enter expiry date';
        }
        if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
          return 'Invalid format (MM/YY)';
        }

        final month = int.tryParse(value.substring(0, 2)) ?? 0;
        final year = int.tryParse(value.substring(3, 5)) ?? 0;
        if (month < 1 || month > 12) {
          return 'Invalid month (01-12)';
        }
        final now = DateTime.now();
        final currentYear = now.year % 100;
        final currentMonth = now.month;
        if (year < currentYear ||
            (year == currentYear && month < currentMonth)) {
          return 'Card expired';
        }
        return null;
      },
    );
  }

  Widget _cardHolderNameField() {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: 'Card Holder Name',
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) => setState(() => cardHolderName = value),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter card holder name';
        }
        return null;
      },
    );
  }

  Widget _cvvField() {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      decoration: InputDecoration(
        labelText: 'CVV',
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
          return 'Please enter CVV';
        }
        return null;
      },
    );
  }
}
