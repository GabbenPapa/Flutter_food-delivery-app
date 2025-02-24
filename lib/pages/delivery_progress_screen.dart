import 'package:flutter/material.dart';
import 'package:food_delivery/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../comonents/receipt.dart';
import '../services/database/database.dart';

class DeliveryProgressScreen extends StatefulWidget {
  static const routeName = '/delivery_progress';

  const DeliveryProgressScreen({super.key});

  @override
  State<DeliveryProgressScreen> createState() => _DeliveryProgressScreenState();
}

class _DeliveryProgressScreenState extends State<DeliveryProgressScreen> {
  FirestoreDatabase db = FirestoreDatabase();

  @override
  void initState() {
    super.initState();

    String receipt = context.read<CartProvider>().displayCartReceipt(context);
    db.saveOrdersToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Delivery Progress'),
      ),
      body: Column(
        children: [Receipt()],
      ),
    );
  }
}
