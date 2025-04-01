import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  AppImages._();

  //Images
  static AssetImage appLogo = const AssetImage('assets/images/logo.png');
  static AssetImage binImage1 = const AssetImage('assets/images/bin_image1.jpg');
  static AssetImage binImage2 = const AssetImage('assets/images/bin_image2.jpg');
  static AssetImage binImage3 = const AssetImage('assets/images/bin_image3.jpg');

  
  //Svgs
  static SvgPicture svgCloseBottomSheetIcon = SvgPicture.asset(
    'assets/svgs/close_bottom_sheet_icon.svg',
  );
}
