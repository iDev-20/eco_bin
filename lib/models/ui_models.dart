import 'package:flutter/material.dart';

class LatestUpdates {
  final IconData icon;
  final String heading;
  final String time;
  final String update;

  LatestUpdates(
      {required this.icon,
      required this.heading,
      required this.time,
      required this.update});
}

class RegisteredBins {
  final String binName;
  final String binNumber;
  final String binOwner;
  final String outstandingBill;

  RegisteredBins(
      {required this.binName,
      required this.binNumber,
      required this.binOwner,
      required this.outstandingBill});

// Convert object to Map for SharedPreferences
  Map<String, dynamic> toMap() {
    return {
      'binName': binName,
      'binNumber': binNumber,
      'binOwner': binOwner,
      'outstandingBill': outstandingBill,
    };
  }

 // Convert Map back to RegisteredBins object
  factory RegisteredBins.fromMap(Map<String, dynamic> map) {
    return RegisteredBins(
        binName: map['binName'],
        binNumber: map['binNumber'],
        binOwner: map['binOwner'],
        outstandingBill: map['outstandingBill']);
  }
}
