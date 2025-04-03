import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImages {
  AppImages._();

  //Images
  static AssetImage appLogo = const AssetImage('assets/images/logo.png');
  static AssetImage binImage1 =
      const AssetImage('assets/images/bin_image1.jpg');
  static AssetImage binImage2 =
      const AssetImage('assets/images/bin_image2.jpg');
  static AssetImage binImage3 =
      const AssetImage('assets/images/bin_image3.jpg');
  static AssetImage profileImage =
      const AssetImage('assets/images/profile_image.png');

  //Svgs
  static SvgPicture svgCloseBottomSheetIcon =
      SvgPicture.asset('assets/svgs/close_bottom_sheet_icon.svg');
  static SvgPicture svgSuccessDialogIcon =
      SvgPicture.asset('assets/svgs/success_dialog_icon.svg');
  static SvgPicture svgChatIcon = SvgPicture.asset('assets/svgs/chat_icon.svg');
  static SvgPicture svgLocationIcon = SvgPicture.asset('assets/svgs/location_icon.svg');
  static SvgPicture svgLogoutIcon = SvgPicture.asset('assets/svgs/logout_icon.svg');
  static SvgPicture svgAddressIcon = SvgPicture.asset('assets/svgs/address_icon.svg');
  static SvgPicture svgProfileIcon = SvgPicture.asset('assets/svgs/profile_icon.svg');
}
