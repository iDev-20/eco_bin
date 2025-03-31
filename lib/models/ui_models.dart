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
  final String userName;
  final String outstandingBill;

  RegisteredBins(
      {required this.binName,
      required this.binNumber,
      required this.userName,
      required this.outstandingBill});
}
