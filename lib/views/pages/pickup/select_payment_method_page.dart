// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/bottom_sheets.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/transaction_provider.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/mobile_money_provider_bottom_sheet.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_success_page.dart';
// import 'package:waste_management_app/views/pages/pickup/select_bank_bottom_sheet.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';

class SelectPaymentMethodPage extends StatefulWidget {
  const SelectPaymentMethodPage(
      {super.key, this.totalAmount, this.selectedItemsWithQuantity});

  final String? totalAmount;
  final Map<String, int>? selectedItemsWithQuantity;

  @override
  State<SelectPaymentMethodPage> createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState extends State<SelectPaymentMethodPage> {
  List<PaymentMethod> availablePaymentMethods = [
    PaymentMethod.mobileMoney,
    PaymentMethod.card,
    PaymentMethod.cash
  ];

  String? selectedPaymentMethod;

  TextEditingController cardNumber = TextEditingController();
  TextEditingController cardName = TextEditingController();

  MobileMoneyProvider? selectedMomoProvider;

  String? selectedBank;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppPageSecondary(
          title: 'Select Payment Method',
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const Text(
                        'Payment method',
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Select your most preferred payment method',
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 16),
                      ...availablePaymentMethods.map(
                        (option) => paymentType(
                          paymentMethod: option,
                          selected: selectedPaymentMethod == option.value,
                          onTap: () {
                            setState(() {
                              selectedPaymentMethod = option.value;
                              cardNumber.clear();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Visibility(
                        visible:
                            selectedPaymentMethod != null && isCash() == false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Account Information',
                              style: TextStyle(
                                  color: AppColors.darkBlueText,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                showAppBottomSheet(
                                  context: context,
                                  title: 'Mobile Money Provider',
                                  child: SelectMobileMoneyProviderBottomSheet(
                                    onButtonTap: (provider) {
                                      setState(() {
                                        selectedMomoProvider = provider;
                                      });
                                    },
                                  ),
                                );
                              },
                              child: Visibility(
                                visible: isMomo() == true,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Mobile Money Provider',
                                      style: TextStyle(
                                          color: AppColors.darkBlueText,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: AppColors.grey200),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Visibility(
                                            visible:
                                                showSelectedAccountName() !=
                                                    null,
                                            replacement: const Text(
                                              'Select',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            child: Text(
                                              showSelectedAccountName() ?? '',
                                              style: const TextStyle(
                                                  color: AppColors.darkBlueText,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 17,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                            PrimaryTextFormField(
                              height: 36,
                              labelText: getSecondSelectionLabel(),
                              hintText: getHintText(),
                              controller: cardNumber,
                              keyboardType: TextInputType.number,
                              textInputAction: isMomo()
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              maxLength: isMomo() ? 10 : 16,
                              onChanged: (c) {
                                setState(() {});
                              },
                            ),
                            Visibility(
                              visible: isMomo() == false,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: PrimaryTextFormField(
                                          height: 36,
                                          labelText: 'CVV',
                                          // controller: cardNumber,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          maxLength: 3,
                                          onChanged: (c) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: PrimaryTextFormField(
                                          height: 36,
                                          labelText: 'Expiry date',
                                          // controller: cardNumber,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          onChanged: (c) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  PrimaryTextFormField(
                                    height: 36,
                                    labelText: 'Name on Card',
                                    hintText: 'John Doe',
                                    controller: cardName,
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.done,
                                    textCapitalization:
                                        TextCapitalization.words,
                                    onChanged: (c) {
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PrimaryButton(
                  enabled: enableButton(),
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (isCash() == true) {
                      Provider.of<TransactionProvider>(context, listen: false)
                          .addTransaction(
                        TransactionModel(
                          selectedItemsWithQuantity:
                              widget.selectedItemsWithQuantity ?? {},
                          // binNumber: 'binNumber',
                          method: 'Cash',
                          amount: widget.totalAmount ?? '',
                          status: 'Pending',
                          createdAt: DateTime.now(),
                        ),
                      );
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));

                      if (mounted) {
                        setState(() {
                          isLoading = false;
                        });
                      }

                      Provider.of<TransactionProvider>(context, listen: false)
                          .addTransaction(
                        TransactionModel(
                          selectedItemsWithQuantity:
                              widget.selectedItemsWithQuantity ?? {},
                          // binNumber: 'binNumber',
                          method: isMomo() ? 'Mobile Money' : 'Card',
                          amount: widget.totalAmount ?? '',
                          status: 'Completed',
                          createdAt: DateTime.now(),
                        ),
                      );
                    }

                    Navigation.navigateToScreen(
                        context: context,
                        screen: const RequestPickupSuccessPage());
                  },
                  child: Text(isCash()
                      ? 'Confirm Payment'
                      : 'Pay GH₵ ${widget.totalAmount}'),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: SpinKitDoubleBounce(
                color: AppColors.primaryColor,
                size: 60,
              ),
            ),
          ),
      ],
    );
  }

  bool enableButton() {
    return selectedMomoProvider != null ||
        isCash() ||
        cardNumber.text.isNotEmpty && cardName.text.isNotEmpty;
  }

  String? showSelectedAccountName() {
    return selectedMomoProvider?.text;
  }

  bool isMomo() {
    return selectedPaymentMethod == PaymentMethod.mobileMoney.value;
  }

  bool isCash() {
    return selectedPaymentMethod == PaymentMethod.cash.value;
  }

  String getSecondSelectionLabel() {
    if (isMomo()) {
      return 'Enter your mobile number';
    }
    return 'Enter your card number';
  }

  String getHintText() {
    if (isMomo()) {
      return 'e.g 0204 123 467';
    }
    return 'Enter card number';
  }

  Widget paymentType(
      {required PaymentMethod paymentMethod,
      required bool selected,
      required VoidCallback onTap}) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
                color: selected ? AppColors.grey100 : null,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    paymentMethod.icon,
                    const SizedBox(width: 8),
                    Text(
                      paymentMethod.text,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                AppCheckBoxWidget(selected: selected)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
