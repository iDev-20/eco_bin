import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/models/ui_models.dart';

class AddressProvider extends ChangeNotifier {
  List<SavedAddress> _address = [];

  List<SavedAddress> get addresses => _address;

  Future<void> loadAddresses() async {
    _address = await SharedPrefs.loadAddresses();
    notifyListeners();
  }

  Future<void> addAddress(SavedAddress savedAddress) async {
    _address.add(savedAddress);
    await SharedPrefs.savedAddresses(_address);
    notifyListeners();
  }

  Future<void> removeAddresses(String address) async {
    _address.removeWhere((addr) => addr.address == address);
    await SharedPrefs.savedAddresses(_address);
    notifyListeners();
  }

  Future<void> updateAddress(
      SavedAddress oldAddress, SavedAddress newAddress) async {
    final index = _address.indexOf(oldAddress);
    if (index != -1) {
      _address[index] = newAddress;
      await SharedPrefs.savedAddresses(_address);
      notifyListeners();
    }
  }
}
