import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

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

class Transaction {
  final String binNumber;
  final String method;
  final String amount;
  final String status;

  Color statusColor() {
    if (status == 'Completed') {
      return AppColors.primaryColor;
    } else if (status == 'Pending') {
      return Colors.grey;
    } else if (status == 'Failed') {
      return Colors.red;
    }
    return Colors.black;
  }

  Transaction({
    required this.binNumber,
    required this.method,
    required this.amount,
    required this.status,
  });
}

class TimePeriod {
  final String period;
  final List<String> timeSlots;

  static TimePeriod morning = TimePeriod(period: 'Morning', timeSlots: [
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ]);

  static TimePeriod afternoon = TimePeriod(period: 'Afternoon', timeSlots: [
    '12:30 PM',
    '12:00 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
  ]);

  static TimePeriod evening = TimePeriod(period: 'Evening', timeSlots: [
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
  ]);

  TimePeriod({required this.period, required this.timeSlots});
}

class SavedAddress {
  final String address;
  final String? addressDetail;

  SavedAddress({required this.address, this.addressDetail});

  Map<String, dynamic> toMap() {
    return {'address': address, 'addressDetail': addressDetail};
  }

  factory SavedAddress.fromMap(Map<String, dynamic> map) {
    return SavedAddress(
      address: map['address'],
      addressDetail: map['addressDetail'],
    );
  }
}
