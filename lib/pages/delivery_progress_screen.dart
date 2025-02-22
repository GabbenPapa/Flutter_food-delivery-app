import 'package:flutter/material.dart';

import '../comonents/receipt.dart';

class DeliveryProgressScreen extends StatelessWidget {
  static const routeName = '/delivery_progress';

  const DeliveryProgressScreen({super.key});

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
