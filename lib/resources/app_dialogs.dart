// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class AddBinAlertDialog extends StatelessWidget {
  const AddBinAlertDialog({
    super.key,
    required this.addBin,
    required this.context,
  });

  final Function(String, String, String)? addBin;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    TextEditingController binNumberController = TextEditingController();
    TextEditingController binNameController = TextEditingController();
    TextEditingController binOwnerController = TextEditingController();
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Material(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Bin',
              style: TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              'This process takes less than a minute',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 8),
            PrimaryTextFormField(
              bottomPadding: 3.0,
              labelText: 'Unique name to identify your bin',
              controller: binNameController,
              keyboardType: TextInputType.name,
            ),
            PrimaryTextFormField(
              bottomPadding: 3.0,
              labelText: 'Please enter your bin number',
              controller: binNumberController,
              keyboardType: TextInputType.visiblePassword,
            ),
            PrimaryTextFormField(
              labelText: 'Owner of bin',
              controller: binOwnerController,
              keyboardType: TextInputType.name,
            ),
            Row(
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    onTap: () {
                      Navigation.back(context: context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    onTap: () async {
                      if (binNameController.text.isNotEmpty &&
                          binNumberController.text.isNotEmpty &&
                          binOwnerController.text.isNotEmpty) {
                        addBin?.call(
                          binNameController.text,
                          binNumberController.text,
                          binOwnerController.text,
                        );

                        Navigation.back(context: context);
                      }
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class AppDialogs {
  AppDialogs._();

  static showConfirmationDialog(
      {required BuildContext context,
      required String message,
      String title = 'Confirm',
      required VoidCallback? afterConfirmation,
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
                  color: Colors.pink,
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
                        color: Colors.black,
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
      VoidCallback? action,
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
