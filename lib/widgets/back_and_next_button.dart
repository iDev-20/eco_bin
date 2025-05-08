import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';

class BackAndNextButton extends StatelessWidget {
  const BackAndNextButton(
      {super.key,
      required this.onNextButtonTap,
      this.onBackButtonTap,
      this.onNextButtonEnabled,
      this.onBackButtonEnabled,
      this.firstText,
      this.secondText,
      this.padding});

  final VoidCallback onNextButtonTap;
  final VoidCallback? onBackButtonTap;
  final bool? onNextButtonEnabled;
  final bool? onBackButtonEnabled;
  final String? firstText;
  final String? secondText;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PrimaryOutlinedButton(
              enabled: onBackButtonEnabled ?? true,
              onTap: onBackButtonTap ??
                  () {
                    Navigation.back(context: context);
                  },
              child: Text(firstText ?? 'Back'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: PrimaryButton(
              enabled: onNextButtonEnabled ?? true,
              onTap: onNextButtonTap,
              child: Text(secondText ?? 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}
