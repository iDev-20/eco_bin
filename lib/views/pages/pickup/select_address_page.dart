import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/components/address_page_empty_state.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({super.key});

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  List<SavedAddress> savedAddresses = [
    SavedAddress(address: 'East Legon Police Station'),
    SavedAddress(address: 'Home', addressDetail: 'Sowutuom School Junction'),
    SavedAddress(address: 'Aplaku M/A Basic School, Weija'),
    SavedAddress(address: 'Office', addressDetail: 'West Hills Mall, Weija'),
  ];

  SavedAddress? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Address',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(index: 2, length: 3),
                SizedBox(height: 16),
                Text(
                  'Where should we pick up from?',
                  style: TextStyle(
                      color: AppColors.darkBlueText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                AddressPageEmptyState(),
                // const SizedBox(height: 16),
                // ...savedAddresses.map(
                //   (option) => singleAddress(
                //     savedAddress: option,
                //     selected: option == selectedAddress,
                //     onTap: () {
                //       if (selectedAddress == option) {
                //         setState(() {
                //           selectedAddress = null;
                //         });
                //       } else {
                //         setState(() {
                //           selectedAddress = option;
                //         });
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          BackAndNextButton(
            onNextButtonTap: () {},
            onNextButtonEnabled: selectedAddress != null,
          )
        ],
      ),
    );
  }

  Widget singleAddress(
      {required SavedAddress savedAddress,
      required bool selected,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary50 : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selected ? AppColors.primary100 : Colors.grey.shade100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Iconsax.location),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        savedAddress.address,
                        style: const TextStyle(
                            color: AppColors.darkBlueText,
                            fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                        visible:
                            savedAddress.addressDetail?.isNotEmpty ?? false,
                        child: Text(
                          savedAddress.addressDetail ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AppCheckBoxWidget(selected: selected)
            ],
          ),
        ),
      ),
    );
  }
}
