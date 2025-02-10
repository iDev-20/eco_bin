

import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

const kTextFieldInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.all(8.0),
    filled: true,
    fillColor: Color(0x1FFFFFFF),
    // suffixIcon: Padding(
    //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
    //   child: AppImages.svgSearchIcon,
    // ),
    // suffixIconColor: const Color(0x99EBEBF5),
    hintText: 'Enter your phone number',
    hintStyle: TextStyle(color: AppColors.darkBlueText),
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    //   borderSide: const BorderSide(color: Colors.white),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    //   borderSide: const BorderSide(color: Colors.white),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(20),
    //   borderSide: const BorderSide(color: Colors.white),
    // ),
    border: InputBorder.none);
