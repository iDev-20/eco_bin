import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/views/pages/pickup/components/selectable_option_card.dart';

class SelectBankBottomSheet extends StatefulWidget {
  const SelectBankBottomSheet({super.key, required this.onButtonTap});

  final void Function(String?) onButtonTap;

  @override
  State<SelectBankBottomSheet> createState() => _SelectBankBottomSheetState();
}

class _SelectBankBottomSheetState extends State<SelectBankBottomSheet> {
  List banks = [
    'ABSA Bank Ltd',
    'Access Bank',
    'Bank of Africa Ghana',
    'Bank of Ghana'
  ];

  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...banks.map(
            (bank) => SelectableOptionCard(
              text: bank,
              selected: selectedBank == bank,
              onTap: () {
                setState(() {
                  selectedBank = bank;
                });
              },
            ),
          ),
          // const SizedBox(height: 26),
          PrimaryButton(
            enabled: selectedBank != null,
            onTap: () {
              Navigation.back(context: context);
              widget.onButtonTap(selectedBank);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
