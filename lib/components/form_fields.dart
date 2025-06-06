import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool required;
  final bool autofocus;
  final bool enabled;
  final void Function(String?)? onSaved;
  final String? prefixText;
  final double? height;
  final double? bottomPadding;
  final double? borderRadius;
  final double? focusedBorderRadius;
  final double? enabledBorderRadius;

  const PrimaryTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixWidget,
      this.suffixWidget,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization,
      this.maxLines = 1,
      this.autofocus = false,
      this.maxLength,
      this.obscureText = false,
      this.onTap,
      this.enabled = true,
      this.required = false,
      this.onSaved,
      this.prefixText,
      this.height,
      this.bottomPadding,
      this.borderRadius,
      this.focusedBorderRadius,
      this.enabledBorderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Text(
                    labelText ?? '',
                    style: const TextStyle(
                        color: AppColors.darkBlueText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  Visibility(
                    visible: required,
                    child: const Text(
                      '*',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 54, 36, 0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height ?? 55,
            child: TextFormField(
              autofocus: autofocus,
              obscureText: obscureText,
              style: const TextStyle(
                color: AppColors.darkBlueText,
                // fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                filled: true,
                fillColor: const Color(0x1FFFFFFF),
                prefixStyle: const TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500),
                // suffixIcon: Padding(
                //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                //   child: AppImages.svgSearchIcon,
                // ),
                // suffixIconColor: const Color(0x99EBEBF5),
                prefixText: prefixText,
                hintText: hintText,
                suffixIcon: suffixWidget,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(focusedBorderRadius ?? 10),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(enabledBorderRadius ?? 10),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              onSaved: onSaved,
              maxLength: maxLength,
              buildCounter: (
                context, {
                required int currentLength,
                required bool isFocused,
                required int? maxLength,
              }) =>
                  null,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              enabled: enabled,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPrimaryTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool required;
  final bool autofocus;
  final bool enabled;
  final void Function(String?)? onSaved;

  const CustomPrimaryTextFormField(
      {super.key,
      this.controller,
      this.labelText,
      this.hintText,
      this.prefixWidget,
      this.suffixWidget,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.textInputAction,
      this.maxLines = 1,
      this.autofocus = false,
      this.maxLength,
      this.obscureText = false,
      this.onTap,
      this.enabled = true,
      this.required = false,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Visibility(
          //   visible: labelText != null,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 6),
          //     child: Row(
          //       children: [
          //         Text(
          //           labelText ?? '',
          // style: const TextStyle(
          //     color: Colors.black,
          //     fontSize: 14,
          //     fontWeight: FontWeight.w400),
          //         ),
          //         Visibility(
          //           visible: required,
          //           child: const Text(
          //             '*',
          //             style: TextStyle(
          //                 color: Color.fromRGBO(255, 54, 36, 0.5),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w400),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 60,
            child: TextFormField(
              autofocus: autofocus,
              obscureText: obscureText,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: prefixWidget,
                filled: true,
                fillColor: Colors.grey.shade300,
                suffixIcon: suffixWidget,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                labelText: labelText ?? '',
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                floatingLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                hintText: hintText ?? '',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(166, 164, 164, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(6),
                //   borderSide: BorderSide(color: Colors.grey.shade700),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(6),
                //   borderSide: BorderSide(color: Colors.grey.shade700),
                // ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(4),
                //   borderSide: const BorderSide(color: Colors.black, width: 2.0),
                // ),
              ),
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              onChanged: onChanged,
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }
}

class LongTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool autofocus;
  final bool enabled;
  final TextCapitalization? textCapitalization;

  const LongTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.minLines = 5,
    this.maxLines,
    this.autofocus = false,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.enabled = true,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: labelText != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                labelText ?? '',
                style: const TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          TextFormField(
            autofocus: autofocus,
            minLines: minLines,
            maxLines: maxLines,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              hintText: hintText ?? '',
              hintMaxLines: 3,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
          ),
        ],
      ),
    );
  }
}
