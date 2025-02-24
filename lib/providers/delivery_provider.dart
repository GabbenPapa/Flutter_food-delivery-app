import 'package:flutter/material.dart';

class DeliveryProvider extends ChangeNotifier {
  String _deliveryAddress = '1164 Budapest, Cinkotai út 12.';
  String get deliveryAddress => _deliveryAddress;

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
}
