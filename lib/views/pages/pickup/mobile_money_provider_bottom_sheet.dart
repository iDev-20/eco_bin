import 'package:flutter/material.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/views/pages/pickup/components/selectable_option_card.dart';

class SelectMobileMoneyProviderBottomSheet extends StatefulWidget {
  const SelectMobileMoneyProviderBottomSheet(
      {super.key, required this.onButtonTap});

  final void Function(MobileMoneyProvider?) onButtonTap;

  @override
  State<SelectMobileMoneyProviderBottomSheet> createState() =>
      _SelectMobileMoneyProviderBottomSheetState();
}

class _SelectMobileMoneyProviderBottomSheetState
    extends State<SelectMobileMoneyProviderBottomSheet> {
  List<MobileMoneyProvider> mobileMoneyProviders = [
    MobileMoneyProvider.mtnMomo,
    MobileMoneyProvider.telecelCash,
    MobileMoneyProvider.atMoney,
  ];

  MobileMoneyProvider? selectedProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...(mobileMoneyProviders).map(
            (option) => mobileMoneyCard(
              mobileMoneyProvider: option,
              selected: selectedProvider == option,
              onTap: () {
                setState(() {
                  selectedProvider = option;
                });
              },
            ),
          ),
          // const SizedBox(height: 20),
          PrimaryButton(
            onTap: () {
              Navigation.back(context: context);
              widget.onButtonTap(selectedProvider);
            },
            enabled: selectedProvider != null,
            child: const Text('Select'),
          ),
        ],
      ),
    );
  }

  Widget mobileMoneyCard(
      {required MobileMoneyProvider mobileMoneyProvider,
      required bool selected,
      required Function() onTap}) {
    return SelectableOptionCard(
      text: mobileMoneyProvider.text,
      selected: selected,
      onTap: onTap,
      prefixWidgets: Row(
        children: [
          Image(
            image: mobileMoneyProvider.icon,
            height: 31,
            width: 31,
          ),
          const SizedBox(
            width: 8,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
