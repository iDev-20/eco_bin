import 'package:flutter/material.dart';
import 'package:waste_management_app/components/bottom_sheets.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/mobile_money_provider_bottom_sheet.dart';
import 'package:waste_management_app/views/pages/pickup/select_bank_bottom_sheet.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';

class SelectPaymentMethodPage extends StatefulWidget {
  const SelectPaymentMethodPage({super.key});

  @override
  State<SelectPaymentMethodPage> createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState extends State<SelectPaymentMethodPage> {
  List<PaymentMethod> availablePaymentMethods = [
    PaymentMethod.mobileMoney,
    PaymentMethod.bank
  ];

  String? selectedPaymentMethod;

  TextEditingController cardNumber = TextEditingController();

  MobileMoneyProvider? selectedMomoProvider;

  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
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
                    visible: selectedPaymentMethod != null,
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
                            if (isMomo()) {
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
                            } else {
                              showAppBottomSheet(
                                context: context,
                                title: 'Bank name',
                                child: SelectBankBottomSheet(
                                  onButtonTap: (bank) {
                                    setState(() {
                                      selectedBank = bank;
                                    });
                                  },
                                ),
                              );
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getFirstSelectionLabel(),
                                style: const TextStyle(
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
                                  border: Border.all(color: AppColors.grey200),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible:
                                          showSelectedAccountName() != null,
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        PrimaryTextFormField(
                          height: 36,
                          labelText: getSecondSelectionLabel(),
                          hintText: getHintText(),
                          controller: cardNumber,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onChanged: (c) {
                            setState(() {});
                          },
                        ),
                        Visibility(
                          visible: isMomo() == false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PrimaryTextFormField(
                                  height: 36,
                                  labelText: 'CVV',
                                  // controller: cardNumber,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
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
                                  textInputAction: TextInputAction.done,
                                  onChanged: (c) {
                                    setState(() {});
                                  },
                                ),
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
              enabled: enableButton() && cardNumber.text.isNotEmpty,
              onTap: () {},
              child: const Text('Select'),
            ),
          ],
        ),
      ),
    );
  }

  bool enableButton() {
    if (isMomo()) {
      return selectedMomoProvider != null;
    }
    return selectedBank != null;
  }

  String? showSelectedAccountName() {
    return isMomo() ? selectedMomoProvider?.text : selectedBank;
  }

  bool isMomo() {
    return selectedPaymentMethod == PaymentMethod.mobileMoney.value;
  }

  String getFirstSelectionLabel() {
    if (isMomo()) {
      return 'Mobile Money Provider';
    }
    return 'Bank Name';
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
