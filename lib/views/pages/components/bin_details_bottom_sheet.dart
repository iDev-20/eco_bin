// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/bin_provider.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class BinDetailsBottomSheet extends StatefulWidget {
  final RegisteredBins bin;

  const BinDetailsBottomSheet({super.key, required this.bin});

  @override
  State<BinDetailsBottomSheet> createState() => _BinDetailsBottomSheetState();
}

class _BinDetailsBottomSheetState extends State<BinDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        binDetails(widget.bin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: PrimaryOutlinedButton(
                  // enabled: widget.bin.outstandingBill == '0.00',
                  onTap: () async {
                    bool? confirmDelete = await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return AppAlertDialog(
                          bin: widget.bin,
                          title: AppStrings.confirmRemoval,
                          desc:
                              'Are you sure you want to remove your ${widget.bin.binName}?',
                          firstOption: 'No',
                          onFirstOptionTap: () {
                            Navigation.back(context: context, result: false);
                          },
                          secondOption: 'Yes',
                          onSecondOptionTap: () async {
                            if (double.tryParse(widget.bin.outstandingBill) !=
                                    null &&
                                double.parse(widget.bin.outstandingBill) >
                                    0.00) {
                              bool? outStandingBillResponse =
                                  await showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return AppAlertDialog(
                                    bin: widget.bin,
                                    title:
                                        'Unable to Remove Bin ${widget.bin.binName}',
                                    desc: AppStrings.youCannotRemoveThisBin,
                                    firstOption: AppStrings.cancel,
                                    onFirstOptionTap: () {
                                      //closes the current dialog
                                      Navigation.back(
                                          context: context, result: false);
                                      //closes confirm removal dialog
                                      Navigation.back(
                                          context: context, result: false);
                                    },
                                    secondOption: AppStrings.payBill,
                                    onSecondOptionTap: () {
                                      //uncomment when ready to implement
                                      // Navigation.back(
                                      //     context: context, result: false);
                                    },
                                  );
                                },
                              );
                              if (outStandingBillResponse == false) {
                                // Navigation.back(
                                //     context: context, result: false);
                                return;
                              }
                            }
                            Navigation.back(context: context, result: true);
                          },
                        );
                      },
                    );

                    if (confirmDelete == true) {
                      context
                          .read<BinProvider>()
                          .removeBin(widget.bin.binNumber);
                      Navigation.back(context: context, result: true);
                    }

                    if (confirmDelete == false &&
                        widget.bin.outstandingBill == '0.00') {
                      Navigation.back(context: context, result: false);
                    }
                    // await SharedPrefs.removeBin(widget.bin.binNumber);
                    // List<RegisteredBins> bins = await SharedPrefs.loadBins();
                    // print("Bins after removal: ${bins.length}");
                    // if (mounted) {
                    //   print("Removing bin: ${widget.bin.binNumber}");
                    //   Navigation.back(context: context, result: true);
                    // }
                  },
                  child: const Text(AppStrings.removeBin),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  enabled: widget.bin.outstandingBill != '0.00',
                  onTap: () {},
                  child: const Text(AppStrings.payBill),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget binDetails(RegisteredBins registeredBins) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          binDetail('Bin Name: ', registeredBins.binName),
          binDetail('Bin Number: ', registeredBins.binNumber),
          binDetail('Bin Owner: ', registeredBins.binOwner),
          binDetail('Outstanding Bill: ', registeredBins.outstandingBill),
        ],
      ),
    );
  }

  Widget binDetail(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkBlueText,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            detail,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
