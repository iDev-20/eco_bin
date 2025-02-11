import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

final kTextFieldInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.all(8.0),
  filled: true,
  fillColor: const Color(0x1FFFFFFF),
  // suffixIcon: Padding(
  //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
  //   child: AppImages.svgSearchIcon,
  // ),
  // suffixIconColor: const Color(0x99EBEBF5),
  hintText: 'Enter your phone number',
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
