import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';

class HomeDicriptionBox extends StatelessWidget {
  const HomeDicriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '\$0.99',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 12,
                ),
              ),
              Text(
                localization.deliveryFee,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '15-20 min',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 12,
                ),
              ),
              Text(
                localization.deliveryTime,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
