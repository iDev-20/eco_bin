import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/models/ui_models.dart';

class BinProvider extends ChangeNotifier {
  List<RegisteredBins> _bins = [];

  List<RegisteredBins> get bins => _bins;

  Future<void> loadBins() async {
    _bins = await SharedPrefs.loadBins();
    notifyListeners();
  }

  Future<void> addBin(RegisteredBins bin) async {
    _bins.add(bin);
    await SharedPrefs.saveBins(_bins);
    notifyListeners();
  }

  Future<void> removeBin(String binNumber) async {
    _bins.removeWhere((bin) => bin.binNumber == binNumber);
    await SharedPrefs.saveBins(_bins);
    notifyListeners();
  }
}
