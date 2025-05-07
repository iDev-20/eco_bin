import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    _initializeUserData();
  }

  Future<void> _initializeUserData() async {
    _userName = await SharedPrefs.getUserName();
    _userEmail = await SharedPrefs.getUserEmail();
    notifyListeners();
  }
  
  String? _userName;
  String? _userEmail;
  String? get userName => _userName;
  String? get userEmail => _userEmail;

  set userName(String? name) {
    _userName = name;
    SharedPrefs.setUserName(name);
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