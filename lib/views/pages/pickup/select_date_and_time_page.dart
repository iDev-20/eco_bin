import 'package:flutter/material.dart';
import 'package:waste_management_app/components/bottom_sheets.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/pickup/components/select_date_bottom_sheet.dart';
import 'package:waste_management_app/views/pages/pickup/components/select_time_widget.dart';
import 'package:waste_management_app/views/pages/pickup/select_address_page.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';

class SelectTimeAndDatePage extends StatefulWidget {
  const SelectTimeAndDatePage({super.key});

  @override
  State<SelectTimeAndDatePage> createState() => _SelectTimeAndDatePageState();
}

class _SelectTimeAndDatePageState extends State<SelectTimeAndDatePage> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Date and Time',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(index: 1, length: 3),
                SizedBox(height: 16),
                Text(
                  'Choose Date and Time',
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
                const SizedBox(height: 8),
                singleFieldWidget(
                  labelText: 'What day is convenient for you?',
                  hintText: 'Select date',
                  value: selectedDate?.fullFriendlyDateWithWeekDay(),
                  // onTap: () async {
                  //   try {
                  //     DateTime? res = await showAppBottomSheet(
                  //       context: context,
                  //       showCloseButton: false,
                  //       child: const SelectDateBottomSheet(),
                  //     );

                  //     // Print the result type to verify if it's a DateTime
                  //     print('Result type: ${res.runtimeType}');

                  //     if (res != null) {
                  //       setState(() {
                  //         selectedDate = res;
                  //       });
                  //     }
                  //   } catch (e) {
                  //     // If there's an error, print it out
                  //     print('Error occurred: $e');
                  //   }
                  // },
                  onTap: () async {
                    DateTime? res = await showAppBottomSheet(
                        context: context,
                        showCloseButton: false,
                        child: const SelectDateBottomSheet());
                    if (res != null) {
                      setState(() {
                        selectedDate = res;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                const SelectTimeWidget()
              ],
            ),
          ),
          BackAndNextButton(
            // onNextButtonEnabled: selectedDate != null,
            onNextButtonTap: () {
            Navigation.navigateToScreen(
                context: context, screen: const SelectAddressPage());
          })
        ],
      ),
    );
  }

  Widget singleFieldWidget({
    required String labelText,
    Widget? labelWidget,
    required String hintText,
    required VoidCallback onTap,
    required String? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
              color: AppColors.darkBlueText, fontWeight: FontWeight.w600),
        ),
        labelWidget ?? const SizedBox.shrink(),
        const SizedBox(
          height: 12,
        ),
        Material(
          color: AppColors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Visibility(
                      visible: value != null,
                      replacement: Text(
                        hintText,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500),
                      ),
                      child: Text(
                        value ?? '',
                        style: const TextStyle(
                            color: AppColors.darkBlueText,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey.shade900,
                    size: 23,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
