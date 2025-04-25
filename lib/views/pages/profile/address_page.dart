// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/address_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/pickup/components/address_page_empty_state.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';
import 'package:waste_management_app/widgets/page_divider.dart';
import 'package:waste_management_app/widgets/single_address.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  SavedAddress? selectedAddress;

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final addresses = addressProvider.addresses;

    return AppPageSecondary(
      title: AppStrings.savedAddresses,
      actions: [
        ...(addresses.isEmpty
            ? []
            : [
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
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.primaryColor,
                      size: 25,
                    ),
                  ),
                ),
              ]),
      ],
      body: Column(
        children: [
          const PageDividerSecondary(),
          Expanded(
            child: addresses.isEmpty
                ? const AddressPageEmptyState(
                    iconColor: AppColors.darkBlueText,
                    textColor: AppColors.darkBlueText,
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      const SizedBox(height: 16),
                      ...addresses.map(
                        (option) => SingleEditableAddress(
                          savedAddress: option,
                          onTap: () async {
                            setState(() {
                              selectedAddress = option;
                            });
                            await showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AppAlertDialog(
                                  title: 'Address',
                                  desc: ((selectedAddress
                                                  ?.addressDetail?.isEmpty ??
                                              false)
                                          ? selectedAddress?.address
                                          : selectedAddress?.addressDetail ??
                                              '') ??
                                      '',
                                  subDesc: (selectedAddress
                                              ?.addressDetail?.isNotEmpty ??
                                          false)
                                      ? selectedAddress?.address
                                      : selectedAddress?.addressDetail ?? '',
                                  firstOption: 'Remove',
                                  onFirstOptionTap: () async {
                                    final provider =
                                        context.read<AddressProvider>();

                                    await provider
                                        .removeAddresses(option.address);
                                    Navigation.back(context: context);
                                    // await showAdaptiveDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return AppAlertDialog(
                                    //         title: 'Remove Address',
                                    //         desc:
                                    //             'Are you sure you want to remove this address',
                                    //         firstOption: 'No, keep it',
                                    //         secondOption: 'Yes, remove',
                                    //         onSecondOptionTap: () async {
                                    //           final provider = context
                                    //               .read<AddressProvider>();

                                    //           await provider.removeAddresses(
                                    //               option.address);
                                    //           Navigation.back(context: context);
                                    //           Navigation.back(context: context);
                                    //         },
                                    //         onFirstOptionTap: () {
                                    //           Navigation.back(context: context, result: false);
                                    //         });
                                    //   },
                                    // );
                                  },
                                  secondOption: 'Edit Address',
                                  onSecondOptionTap: () async {
                                    final newAddress =
                                        await showAdaptiveDialog<SavedAddress>(
                                      context: context,
                                      builder: (context) {
                                        return AddAddressDialog(
                                          context: context,
                                          existingAddress: option,
                                        );
                                      },
                                    );
                                    if (newAddress != null) {
                                      context
                                          .read<AddressProvider>()
                                          .updateAddress(option, newAddress);
                                    }
                                    Navigation.back(context: context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
