// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';


class AppDialogs {
  AppDialogs._();

  static showConfirmationDialog(
      {required BuildContext context,
      required String message,
      String title = 'Confirm',
      required Function()? afterConfirmation,
      String confirmText = 'Confirm',
      bool barrierDismissible = true}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => PopScope(
        canPop: barrierDismissible,
        child: AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 24),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 24),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.darkBlueText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              PrimaryButton(onTap: afterConfirmation, child: Text(confirmText)),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.darkBlueText,
                        fontWeight: FontWeight.w700),
                  )),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  static Future showSuccessDialog(
      {required BuildContext context,
      required String message,
      Function()? action,
      bool barrierDismissible = true}) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppSuccessDialogWidget(
        message: message,
        action: action,
        hasTitle: false,
      ),
    );
  }
}
