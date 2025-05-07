// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/models/ui_models.dart';

class SharedPrefs {
  //Bins
  static const String _binsKey = 'registeredBins';

  static Future<void> saveBins(List<RegisteredBins> bins) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> binsJson = bins.map((bin) => jsonEncode(bin.toMap())).toList();
    await prefs.setStringList(_binsKey, binsJson);
  }

  static Future<List<RegisteredBins>> loadBins() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? binsJson = prefs.getStringList(_binsKey);

    if (binsJson == null) return [];

    return binsJson
        .map((json) => RegisteredBins.fromMap(jsonDecode(json)))
        .toList();
  }

  static Future<void> removeBin(String binNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<RegisteredBins> bins = await loadBins();

    //remove the bin with the matching bin number
    bins.removeWhere((bin) => bin.binNumber == binNumber);

    //save the updated list back to Shared preferences
    await saveBins(bins);
  }

  //Addresses
  static const String _addressKey = 'savedPickupAddresses';

  static Future<void> savedAddresses(List<SavedAddress> addresses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> addressJson =
        addresses.map((addr) => jsonEncode(addr.toMap())).toList();
    await prefs.setStringList(_addressKey, addressJson);
  }

  static Future<List<SavedAddress>> loadAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? addressJson = prefs.getStringList(_addressKey);

    if (addressJson == null) return [];

    return addressJson
        .map((json) => SavedAddress.fromMap(jsonDecode(json)))
        .toList();
  }

  static Future<void> removeAddress(String address) async {
    List<SavedAddress> addresses = await loadAddresses();

    //Remove address with matching address
    addresses.removeWhere((addr) => addr.address == address);

    //Save updated list back
    await savedAddresses(addresses);
  }

  //Transactions
  static const String _transactionKey = 'transactions';

  static Future<void> savedTransactions(
      List<TransactionModel> transactions) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> transactionJson =
        transactions.map((tx) => jsonEncode(tx.toMap())).toList();
    await prefs.setStringList(_transactionKey, transactionJson);
  }

  static Future<List<TransactionModel>> loadTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? transactionJson = prefs.getStringList(_transactionKey);

    if (transactionJson == null) return [];

    return transactionJson
        .map((json) => TransactionModel.fromMap(jsonDecode(json)))
        .toList();
  }

  //SignUp & Login
  static Future<void> saveUser(String phoneNumber, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
    await prefs.setString('password', password);
  }

  static Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? phoneNumber = prefs.getString('phoneNumber');
    String? password = prefs.getString('password');

    return {'phoneNumber': phoneNumber, 'password': password};
  }

  static Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('loggedInUser');
  }

  static Future<String> getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber') ?? '';
  }
}
