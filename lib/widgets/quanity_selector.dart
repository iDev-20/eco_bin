import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector(
      {super.key,
      required this.value,
      required this.onAddTap,
      required this.onMinusTap});

  final int value;
  final Function() onMinusTap;
  final Function() onAddTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey200)),
      child: Row(
        children: [
          actionBox(
              onTap: value != 0 ? onMinusTap : null,
              icon: Icons.remove,
              isMinus: true),
          Container(
            width: 38,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(color: AppColors.grey200))),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                    color: value == 0
                        ? Colors.grey.shade500
                        : AppColors.darkBlueText,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          actionBox(onTap: onAddTap, icon: Icons.add, isMinus: false),
        ],
      ),
    );
  }

  Widget actionBox(
      {required Function()? onTap,
      required IconData icon,
      required bool isMinus}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 41,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: isMinus
              ? const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
        ),
        child: Center(
          child: Icon(icon, size: 18),
        ),
      ),
    );
  }
}
