import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';

class SelectableOptionCard extends StatelessWidget {
  const SelectableOptionCard({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
    this.prefixWidgets,
  });

  final String text;
  final Row? prefixWidgets;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: AppColors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8
              ),
              decoration: BoxDecoration(
                  color: selected ? AppColors.grey100 : null,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      prefixWidgets ?? const SizedBox.shrink(),
                      Text(
                        text,
                        style: const TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  AppCheckBoxWidget(selected: selected)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}