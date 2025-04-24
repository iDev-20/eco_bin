import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key, 
    required this.index,
    required this.length,
    this.visible = true
  });

  final int index;
  final int length;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Row(
        children: [
          singleIndicator(enabled: true),
          singleIndicator(enabled: index > 0),
          Visibility(
            visible: length > 2,
            child: singleIndicator(enabled: index > 1)
          ),
          Visibility(
            visible: length > 3,
            child: singleIndicator(enabled: index > 2)
          ),
        ],
      ),
    );
  }

  Widget singleIndicator({required bool enabled}){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Container(
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: enabled? AppColors.primaryColor : Colors.grey[200]
          ),
        ),
      ),
    );
  }
}