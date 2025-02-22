import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  const Receipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Thank you for your order',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Receipt here...",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
