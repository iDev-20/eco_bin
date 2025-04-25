// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/address_provider.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';

class AppLoadingDialogWidget extends StatelessWidget {
  const AppLoadingDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      content: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
            // const SizedBox(height: AppDimens.defaultMarginMidExtra2),
            // Text(
            //   loadingText ?? AppStrings.loading,
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
      // actions: [
      //   FutureBuilder(
      //       future: Future.delayed(const Duration(seconds: AppConstants.displayCancelOnDialogAfter), () => true),
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return InkWell(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: const Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.symmetric(vertical: AppDimens.mediumSpacing),
      //                   child: Text(
      //                     AppStrings.cancel,
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: AppDimens.normalFontSize,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         }

      //         return const SizedBox();
      //       })
      // ],
    );
  }
}

class AppSuccessDialogWidget extends StatelessWidget {
  const AppSuccessDialogWidget(
      {super.key,
      required this.message,
      this.title,
      required this.action,
      required this.hasTitle});

  final String message;
  final String? title;
  final Function? action;
  final bool hasTitle;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: AlertDialog(
        contentPadding: const EdgeInsets.only(top: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AppImages.svgSuccessDialogIcon,
            const SizedBox(height: 16),
            Visibility(
              visible: hasTitle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      title ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                message,
                style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: AppColors.primaryColor,
              thickness: 1,
              height: 0,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                action?.call();
              },
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        color: AppColors.darkBlueText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        color: AppColors.transparent,
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
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            PrimaryTextFormField(
              bottomPadding: 3.0,
              labelText: 'Please enter your bin number',
              controller: binNumberController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.characters,
            ),
            PrimaryTextFormField(
              labelText: 'Owner of bin',
              controller: binOwnerController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
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

class AddAddressDialog extends StatelessWidget {
  const AddAddressDialog({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    TextEditingController locationNameController = TextEditingController();
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Material(
        elevation: 0,
        color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Address',
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
              labelText: 'Address',
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.words,
            ),
            PrimaryTextFormField(
              bottomPadding: 3.0,
              labelText: 'Name of Location(Optional)',
              controller: locationNameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
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
                      if (addressController.text.isNotEmpty) {
                        final provider = context.read<AddressProvider>();

                        final newAddress = SavedAddress(
                            address: addressController.text.trim(),
                            addressDetail: locationNameController.text.trim());

                        await provider.addAddress(newAddress);
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

class AppAlertDialog extends StatelessWidget {
  final RegisteredBins? bin;
  final String title;
  final String desc;
  final String? subDesc;
  final String firstOption;
  final String secondOption;
  final VoidCallback onFirstOptionTap;
  final VoidCallback onSecondOptionTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const AppAlertDialog(
      {super.key,
      this.bin,
      required this.title,
      required this.desc,
      this.subDesc,
      required this.firstOption,
      required this.secondOption,
      required this.onSecondOptionTap,
      required this.onFirstOptionTap,
      this.backgroundColor,
      this.borderColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Material(
        elevation: 0,
        color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.darkBlueText,
                // fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subDesc ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                // fontSize: 20,
                // fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: PrimaryOutlinedButton(
                    borderColor: borderColor ?? AppColors.primaryColor,
                    onTap: onFirstOptionTap,
                    child: Text(
                      firstOption,
                      style: TextStyle(
                        color: textColor ?? AppColors.primaryColor,
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PrimaryButton(
                    backgroundColor: backgroundColor ?? AppColors.primaryColor,
                    onTap: onSecondOptionTap,
                    child: Text(secondOption),
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
