// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/models/ui_models.dart';

class SharedPrefs {
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
}
