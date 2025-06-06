// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/bottom_sheets.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/providers/bin_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/bins/components/bin_details_bottom_sheet.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class BinsPage extends StatefulWidget {
  const BinsPage({super.key});

  @override
  State<BinsPage> createState() => _BinsPageState();
}

class _BinsPageState extends State<BinsPage> {
  List<RegisteredBins> bins = [];

  @override
  void initState() {
    super.initState();
    _loadBins();
  }

  void _loadBins() async {
    bins = await SharedPrefs.loadBins();
    print("Bins loaded: ${bins.length}");
    setState(() {});
  }

  void createBin(BuildContext context, String binName, String binNumber,
      String binOwner) async {
    final binProvider = context.read<BinProvider>();
    binProvider.addBin(RegisteredBins(
        binName: binName,
        binNumber: binNumber,
        binOwner: binOwner,
        outstandingBill: '10.00'));
  }

  void openBinDetails(
      {required BuildContext context, required RegisteredBins bin}) async {
    final binProviderr = context.read<BinProvider>();

    bool? removed = await showAppBottomSheet(
        context: context,
        title: AppStrings.binDetails,
        child: BinDetailsBottomSheet(bin: bin));

    print("Bin removed? $removed");

    if (removed == true) {
      binProviderr.removeBin(bin.binNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    var binProvider = context.watch<BinProvider>();
    var bins = binProvider.bins;

    return AppPage(
      title: AppStrings.binsCaps,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: bins.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Start managing your bins—',
                      style: TextStyle(
                          color: AppColors.darkBlueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return AddBinAlertDialog(
                                context: context,
                                addBin: (name, number, owner) =>
                                    createBin(context, name, number, owner),
                              );
                            });
                      },
                      child: const Text(
                        AppStrings.addOneNow,
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              : ListView(
                  padding: const EdgeInsets.only(top: 8.0),
                  children: [
                    ...bins
                        .map(
                          (bin) => singleBin(bin),
                        )
                        .toList(),
                  ],
                ),
        ),
      ),
      addBin: (name, number, owner) => createBin(context, name, number, owner),
    );
  }

  Widget singleBin(RegisteredBins registeredBins) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onLongPress: () {
          
        },
        onTap: () {
          openBinDetails(context: context, bin: registeredBins);
          // showAppBottomSheet(
          //     context: context,
          //     title: AppStrings.binDetails,
          //     showCloseButton: true,
          //     child: BinDetailsBottomSheet(bin: registeredBins));
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 8, top: 12, right: 16, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            // border: Border.all(color: AppColors.darkBlueText),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                  height: 70,
                  width: 50,
                  child: Image(image: AppImages.binImage2)),
              const SizedBox(width: 5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          registeredBins.binName,
                          style: const TextStyle(
                              color: AppColors.darkBlueText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          registeredBins.binNumber,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          registeredBins.binOwner,
                          style: const TextStyle(
                              color: AppColors.darkBlueText,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          AppStrings.outstandingBin,
                          style: TextStyle(
                              color: AppColors.darkBlueText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'GH₵ ${registeredBins.outstandingBill}',
                          style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
