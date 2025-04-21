import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class AppCheckBoxWidget extends StatelessWidget {
  const AppCheckBoxWidget({super.key, required this.selected});

  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Icon(
      selected ? Icons.check_circle_rounded : Icons.circle_outlined,
      color: selected ? AppColors.primaryColor : Colors.grey[400],
      size: 20,
    );
  }
}
