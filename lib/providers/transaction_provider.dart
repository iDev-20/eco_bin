import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/models/ui_models.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => _transactions;

  Future<void> loadTransactions() async {
    _transactions = await SharedPrefs.loadTransactions();
    notifyListeners();
  }

  void addTransaction(TransactionModel transactionModel) async {
    _transactions.add(transactionModel);
    await SharedPrefs.savedTransactions(_transactions);
    notifyListeners();
  }

  void clearTransactions() {
    _transactions.clear();
    notifyListeners();
  }
}
