import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class PageDivider extends StatelessWidget {
  const PageDivider({super.key, this.height, this.thickness, this.color});

  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          height: 1,
          thickness: 0,
          color: AppColors.darkBlueText,
        ),
        // SizedBox(height: 12.0),
      ],
    );
  }
}
