// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';

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
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('binNumber', binNameController.text);
                        prefs.setString('binNumber', binNumberController.text);
                        prefs.setString('binNumber', binOwnerController.text);
                        prefs.setBool('isBinCreated', true);
                        
                        Navigation.back(context: context);
                        // binNumberController.clear();
                        // binNameController.clear();
                        // binOwnerController.clear();
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
