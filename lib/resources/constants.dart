import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

final kTextFieldInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(8.0),
  filled: true,
  fillColor: const Color(0x1FFFFFFF),
  prefixStyle: const TextStyle(
    color: AppColors.darkBlueText,
    fontSize: 15.0,
    fontWeight: FontWeight.w500
  ),
  // suffixIcon: Padding(
  //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
  //   child: AppImages.svgSearchIcon,
  // ),
  // suffixIconColor: const Color(0x99EBEBF5),
  hintStyle: const TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.splashScreenGreen),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey.shade400),
  ),
);
