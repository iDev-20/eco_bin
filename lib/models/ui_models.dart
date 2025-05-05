import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';

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

class TransactionModel {
  // final String binNumber;
  final Map<String, int> selectedItemsWithQuantity;
  final String method;
  final String amount;
  final String status;
  final DateTime createdAt;

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

  TransactionModel({
    // required this.binNumber,
    required this.selectedItemsWithQuantity,
    required this.method,
    required this.amount,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'binNumber': binNumber,
      'selectedItemsWithQuantity': selectedItemsWithQuantity,
      'method': method,
      'amount': amount,
      'status': status,
      'date': createdAt.toIso8601String(),
    };
  }

  // Convert Map back to RegisteredBins object
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      // binNumber: map['binNumber'],
      selectedItemsWithQuantity: map['selectedItemsWithQuantity'] != null
          ? Map<String, int>.from(map['selectedItemsWithQuantity'])
          : <String, int>{},
      // selectedItemsWithQuantity: Map<String, int>.from(map['selectedItemsWithQuantity']),
      method: map['method'],
      amount: map['amount'],
      status: map['status'],
      createdAt: DateTime.parse(map['date']),
    );
  }
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

class PaymentMethod {
  final Widget icon;
  final String text;
  final String value;

  static PaymentMethod mobileMoney = PaymentMethod(
      icon: AppImages.svgMobileMoneyIcon,
      text: 'Mobile Money',
      value: 'mobilemoney');

  static PaymentMethod card = PaymentMethod(
      icon: Icon(Iconsax.card, color: Colors.grey.shade600, size: 22),
      text: 'Card',
      value: 'card');

  static PaymentMethod cash = PaymentMethod(
      icon: Icon(Iconsax.money, color: Colors.grey.shade600, size: 22),
      text: 'Cash',
      value: 'cash');

  PaymentMethod({required this.icon, required this.text, required this.value});
}

class MobileMoneyProvider {
  final AssetImage icon;
  final String text;
  final String value;

  static MobileMoneyProvider mtnMomo = MobileMoneyProvider(
      icon: AppImages.mtnMomoLogo, text: 'MTN Mobile Money', value: 'mtn');

  static MobileMoneyProvider telecelCash = MobileMoneyProvider(
      icon: AppImages.telecelLogo, text: 'Telecel Cash', value: 'telecel');

  static MobileMoneyProvider atMoney = MobileMoneyProvider(
      icon: AppImages.atMoneyLogo, text: 'AT Money', value: 'atmoney');

  MobileMoneyProvider(
      {required this.icon, required this.text, required this.value});
}
