import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/providers/address_provider.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class AddressPageEmptyState extends StatefulWidget {
  const AddressPageEmptyState({super.key});

  @override
  State<AddressPageEmptyState> createState() => _AddressPageEmptyStateState();
}

class _AddressPageEmptyStateState extends State<AddressPageEmptyState> {
  void createAddress(String address, String addressDetail) {
    final addressProvider = context.read<AddressProvider>();
    addressProvider.addAddress(
        SavedAddress(address: address, addressDetail: addressDetail));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.location,
                color: Colors.grey.shade400,
                size: 35,
              ),
              const SizedBox(height: 12.5),
              Text(
                AppStrings.youHaveNoSavedAddressesATM,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.25),
                child: PrimaryButton(
                  onTap: () async {
                    await showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return AddAddressDialog(
                          context: context,
                          addAddress: createAddress,
                        );
                      },
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_location_alt_outlined,
                        color: AppColors.white,
                        size: 20,
                      ),
                      Text('Add new address'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
