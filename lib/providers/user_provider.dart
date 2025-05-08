import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    _userName = await SharedPrefs.getUserName();
    _userPhoneNumber = await SharedPrefs.getPhoneNumber();
    _userEmail = await SharedPrefs.getUserEmail();
    notifyListeners();
  }

  String? _userName;
  String? _userPhoneNumber;
  String? _userEmail;

  String? get userName => _userName;
  String? get userPhoneNumber => _userPhoneNumber;
  String? get userEmail => _userEmail;

  set userName(String? name) {
    _userName = name;
    SharedPrefs.setUserName(name);
    notifyListeners();
  }

  set userPhoneNumber(String? phoneNumber) {
    _userPhoneNumber = phoneNumber;
    SharedPrefs.setPhoneNumber(phoneNumber);
    notifyListeners();
  }

  set userEmail(String? email) {
    _userEmail = email;
    SharedPrefs.setUserEmail(email);
    notifyListeners();
  }

  void clearUserData() {
    _userName = null;
    _userEmail = null;
    SharedPrefs.clearUserData();
    notifyListeners();
  }
}
