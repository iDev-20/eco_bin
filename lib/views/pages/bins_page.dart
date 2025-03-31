import 'package:flutter/material.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';

class BinsPage extends StatefulWidget {
  const BinsPage({super.key});

  @override
  State<BinsPage> createState() => _BinsPageState();
}

class _BinsPageState extends State<BinsPage> {
  List<RegisteredBins> bins = [
    RegisteredBins(
        binName: 'Home Bin',
        binNumber: 'ECB123456',
        userName: 'Jermaine Lamar',
        outstandingBill: 'GHC 100.00'),
    RegisteredBins(
        binName: 'Office Bin',
        binNumber: 'EBN265464',
        userName: 'Buju Benson',
        outstandingBill: 'GHC 50.00'),
    RegisteredBins(
        binName: 'Street Bin',
        binNumber: 'ECB254545',
        userName: 'Kendrick Lamar Duckworth',
        outstandingBill: 'GHC 10.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.binsCaps,
      body: Expanded(
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ...bins.map(
                    (bin) => singleBin(bin),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleBin(RegisteredBins registeredBins) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 8, top: 12, right: 16, bottom: 12),
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
                        registeredBins.userName,
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
                        'Outstanding bill',
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        registeredBins.outstandingBill,
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
    );
  }
}
