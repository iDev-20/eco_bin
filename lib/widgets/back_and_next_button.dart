import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';

class BackAndNextButton extends StatelessWidget {
  const BackAndNextButton(
      {super.key, required this.onNextButtonTap, this.onNextButtonEnabled});

  final Function() onNextButtonTap;
  final bool? onNextButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PrimaryOutlinedButton(
              onTap: () {
                Navigation.back(context: context);
              },
              child: const Text('Back'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: PrimaryButton(
              enabled: onNextButtonEnabled ?? true,
              onTap: onNextButtonTap,
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
