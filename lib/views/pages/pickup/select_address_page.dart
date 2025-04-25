import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/address_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/components/address_page_empty_state.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_summary_page.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';
import 'package:waste_management_app/widgets/single_address.dart';

class SelectAddressPage extends StatefulWidget {
  const SelectAddressPage({super.key, this.selectedItems, this.selectedDate, this.selectedTime});

  final List? selectedItems;
  final DateTime? selectedDate;
  final String? selectedTime;

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
                PageIndicator(index: 2, length: 4),
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
                        (option) => SingleAddress(
                            savedAddress: option,
                            selected: option == selectedAddress,
                            onTap: () {
                              setState(() {
                                selectedAddress =
                                    selectedAddress == option ? null : option;
                              });
                            }),
                      ),
                    ],
                  ),
          ),
          BackAndNextButton(
            onNextButtonTap: () {
              Navigation.navigateToScreen(
                  context: context, screen: RequestPickupSummaryPage(
                    selectedItems: widget.selectedItems,
                    selectedDate: widget.selectedDate,
                    selectedTime: widget.selectedTime,
                    selectedAddress: selectedAddress
                  ));
            },
            onNextButtonEnabled: selectedAddress != null,
          )
        ],
      ),
    );
  }
}
