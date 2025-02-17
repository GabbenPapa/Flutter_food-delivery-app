import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

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
  bool isCvvFocused = false;

  void StartPaymentAction() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Confirm Payment",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Card Number: $cardNumber",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Text(
                  "Expiry Date: $expiryDate",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Text(
                  "Card Holder Name: $cardHolderName",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Text(
                  "CVV Code: $cvvCode",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
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
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: Text(
                "Confirm",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
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
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: false,
                    onCreditCardWidgetChange: (p0) {},
                    cardBgColor: Theme.of(context).colorScheme.inversePrimary,
                    isSwipeGestureEnabled: true,
                    animationDuration: Duration(milliseconds: 1000),
                    enableFloatingCard: true,
                  ),
                  CreditCardForm(
                    formKey: formKey,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: (data) {
                      setState(() {
                        cardNumber = data.cardNumber;
                        expiryDate = data.expiryDate;
                        cardHolderName = data.cardHolderName;
                        cvvCode = data.cvvCode;
                        isCvvFocused = data.isCvvFocused;
                      });
                    },
                    inputConfiguration: InputConfiguration(
                      cardNumberDecoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.inverseSurface,
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        fillColor: Theme.of(context).colorScheme.inverseSurface,
                        hintText: 'XXX',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                        ),
                      ),
                      cardNumberTextStyle: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      cardHolderTextStyle: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      expiryDateTextStyle: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      cvvCodeTextStyle: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  StartPaymentAction();
                },
                child: const Text("Pay now"),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
