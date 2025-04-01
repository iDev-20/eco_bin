import 'package:flutter/material.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class BinDetailsBottomSheet extends StatefulWidget {
  final RegisteredBins bin;

  const BinDetailsBottomSheet({super.key, required this.bin});

  @override
  State<BinDetailsBottomSheet> createState() => _BinDetailsBottomSheetState();
}

class _BinDetailsBottomSheetState extends State<BinDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        binDetails(widget.bin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: PrimaryOutlinedButton(
                  onTap: () {
                    Navigation.back(context: context);
                  },
                  child: const Text('Remove Bin'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  onTap: () {},
                  child: const Text('Pay Bill'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget binDetails(RegisteredBins registeredBins) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          binDetail('Bin Name: ', registeredBins.binName),
          binDetail('Bin Number: ', registeredBins.binNumber),
          binDetail('Bin Owner: ', registeredBins.binOwner),
          binDetail('Outstanding Bill: ', registeredBins.outstandingBill),
        ],
      ),
    );
  }

  Widget binDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkBlueText,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            detail,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
