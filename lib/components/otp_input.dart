import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:waste_management_app/resources/app_colors.dart';

// class OtpInput extends StatelessWidget {
//   static const _emptyOtp = "****";

//   final String otpInput;
//   final Function(String)? onSubmit;
//   final Function(String) onChanged;
//   final bool wrongOtp;
//   final bool? autoFocus;

//   final TextEditingController? controller;
//   final String? Function(String?)? validator;

//   const OtpInput({
//     Key? key,
//     this.otpInput = _emptyOtp,
//     this.onSubmit,
//     required this.onChanged,
//     required this.wrongOtp,
//     this.controller,
//     this.validator,
//     this.autoFocus,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PinCodeTextField(
//       appContext: context,
//       length: 5,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly
//       ],
//       autoFocus: autoFocus ?? false,
//       autoDisposeControllers: false,
//       controller: controller,
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(AppDimens.buttonBorderRadiusSmall),
//         fieldHeight: AppDimens.otpBoxSize,
//         fieldWidth: AppDimens.otpBoxSize,
//         selectedBorderWidth: 2,
//         borderWidth: 1,
//         activeColor:
//             wrongOtp == true ? AppColors.errorRed : AppColors.greyInputBorder,
//         inactiveColor:
//             wrongOtp == true ? AppColors.errorRed : AppColors.greyInputBorder,
//         selectedColor: AppColors.primaryColor,
//         activeFillColor: AppColors.greyInputBackground,
//         inactiveFillColor: AppColors.greyInputBackground,
//         selectedFillColor: AppColors.greyInputBackground,
//       ),
//       onSubmit: onSubmit,
//       onChanged: onChanged,
//       hintCharacter: "",
//       hintStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         color: AppColors.black,
//       ),
//       textStyle: const TextStyle(
//         fontSize: 24,
//         fontWeight: AppDimens.fontWeight400,
//         color: AppColors.black
//       ),
//       cursorColor: AppColors.darkGrey,
//       showCursor: false,
//       enableActiveFill: true,
//       enablePinAutofill: true,
//       keyboardType: TextInputType.number,
//       validator: validator,
//     );
//   }
// }

class OtpInput extends StatelessWidget {
  static const _emptyOtp = "****";

  final String otpInput;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final bool wrongOtp;
  final bool? autoFocus;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const OtpInput(
      {this.otpInput = _emptyOtp,
      this.onSubmit,
      this.onChanged,
      required this.wrongOtp,
      this.controller,
      this.validator,
      this.autoFocus,
      super.key});

  @override
  Widget build(BuildContext context) {
    // return PinCodeTextField(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   appContext: context,
    //   length: 5,
    //   inputFormatters: [
    //     FilteringTextInputFormatter.digitsOnly
    //   ],
    //   autoFocus: autoFocus ?? false,
    //   autoDisposeControllers: false,
    //   controller: controller,
    //   pinTheme: PinTheme(
    //     shape: PinCodeFieldShape.box,
    //     borderRadius: BorderRadius.circular(AppDimens.defaultBorderRadiusMini),
    //     fieldHeight: AppDimens.otpBoxSize,
    //     fieldWidth: AppDimens.otpBoxSize,
    //     selectedBorderWidth: 1,
    //     borderWidth: 1,
    //     inactiveBorderWidth: 1,
    //     errorBorderWidth: 1,
    //     activeBorderWidth: 1,
    //     selectedColor: AppColors.primaryColor,
    //     activeColor:
    //         wrongOtp == true ? AppColors.errorRed : AppColors.grey100alt,
    //     inactiveColor:
    //         wrongOtp == true ? AppColors.errorRed : AppColors.grey100alt,
    //     activeFillColor: AppColors.white,
    //     inactiveFillColor: AppColors.white,
    //     selectedFillColor: AppColors.white,
    //   ),
    //   onSubmit: onSubmit,
    //   onChanged: onChanged,
    //   hintCharacter: "",
    //   hintStyle: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //     color: AppColors.black,
    //   ),
    //   textStyle: const TextStyle(
    //     fontSize: AppDimens.normalFontSize,
    //     fontWeight: AppDimens.fontWeight600,
    //     color: AppColors.grey800
    //   ),
    //   cursorColor: AppColors.darkGrey,
    //   showCursor: false,
    //   enableActiveFill: true,
    //   enablePinAutofill: true,
    //   keyboardType: TextInputType.number,
    //   validator: validator,
    //   separatorBuilder: (context, index) => const SizedBox(width: 12,),
    // );

    return PinInputTextField(
      autoFocus: autoFocus ?? false,
      enableInteractiveSelection: true,
      pinLength: 4,
      controller: controller,
      decoration: BoxLooseDecoration(
        strokeWidth: 1,
        gapSpace: 12,
        //bgColorBuilder: PinListenColorBuilder(AppColors.greyInputBackground, AppColors.greyInputBackground),
        strokeColorBuilder:
            PinListenColorBuilder(AppColors.primaryColor, Colors.grey.shade400),
        textStyle: const TextStyle(color: AppColors.darkBlueText),
      ),
      onChanged: onChanged,
      onSubmit: onSubmit,
      cursor: Cursor(
        enabled: true,
        width: 2,
        height: 25,
        color: AppColors.primaryColor,
      ),
    );
  }
}
