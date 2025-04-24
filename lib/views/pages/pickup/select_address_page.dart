import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/providers/address_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/components/address_page_empty_state.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({super.key});

  @override
  State<SelectAddressPage> createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
  SavedAddress? selectedAddress;
  

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final addresses = addressProvider.addresses;

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
            child: addresses.isEmpty
                ? const AddressPageEmptyState()
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Saved Addresses',
                            style: TextStyle(
                                color: AppColors.darkBlueText,
                                fontWeight: FontWeight.w600),
                          ),
                          InkWell(
                            onTap: () async {
                              await showAdaptiveDialog(
                                context: context,
                                builder: (context) {
                                  return AddAddressDialog(
                                    context: context,
                                  );
                                },
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit_location_alt_outlined,
                                  color: AppColors.primaryColor,
                                  size: 18,
                                ),
                                Text(
                                  'Add new address',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...addresses.map(
                        (option) => singleAddress(
                          savedAddress: option,
                          selected: option == selectedAddress,
                          onTap: () {
                            setState(() {
                              selectedAddress =
                                  selectedAddress == option ? null : option;
                            });
                          },
                        ),
                      ),
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
