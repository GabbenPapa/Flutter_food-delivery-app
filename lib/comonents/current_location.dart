import 'package:flutter/material.dart';
import 'package:food_delivery/generated/l10n.dart';
import 'package:food_delivery/providers/delivery_provider.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          localizations.yourLocation,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        content: TextField(
          cursorColor: Theme.of(context).colorScheme.inversePrimary,
          controller: textController,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          decoration: InputDecoration(
            hintText: localizations.addLocation,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text(
              localizations.cancel,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String newAddress = textController.text;
              Provider.of<DeliveryProvider>(context, listen: false)
                  .updateDeliveryAddress(newAddress);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text(
              localizations.save,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          localization.deliverNow,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 12,
          ),
        ),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(
            children: [
              Consumer<DeliveryProvider>(
                builder: (context, delivery, child) => Text(
                  delivery.deliveryAddress,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
