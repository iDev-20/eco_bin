import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/navigation/navigation.dart';

class TransactionDetailBottomSheet extends StatelessWidget {
  const TransactionDetailBottomSheet(
      {super.key,
      required this.selectedWasteTypes,
      required this.status,
      required this.statusColor});

  final Map<String, int> selectedWasteTypes;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'You selected the following waste types for this pickup:',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              // fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          ...selectedWasteTypes.entries.map(
            (entry) => Text(
              '• ${entry.key} (${entry.value})',
              style: const TextStyle(
                color: AppColors.darkBlueText,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: AppColors.darkBlueText,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
              text: 'Status: ',
              children: <TextSpan>[
                TextSpan(
                  text: status,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: statusColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onTap: () {
              Navigation.back(context: context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
