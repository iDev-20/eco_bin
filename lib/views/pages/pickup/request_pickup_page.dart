import 'package:flutter/material.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/pickup/select_date_and_time_page.dart';
import 'package:waste_management_app/widgets/app_checkbox_widget.dart';
import 'package:waste_management_app/widgets/quanity_selector.dart';

class RequestPickupPage extends StatefulWidget {
  const RequestPickupPage({super.key});

  @override
  State<RequestPickupPage> createState() => _RequestPickupPageState();
}

class _RequestPickupPageState extends State<RequestPickupPage> {
  List<Map<String, String>> wasteTypes = [
    {'icon': '♻️', 'title': 'Recyclables'},
    {'icon': '🌿', 'title': 'Organic Waste'},
    {'icon': '🗑️', 'title': 'General Waste'},
  ];

  Map<String, int> selectedItemsWithQuantity = {};

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: AppStrings.wasteType,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(index: 0, length: 4),
                SizedBox(height: 16),
                Text(
                  'What type of waste?',
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
              padding: const EdgeInsets.all(16),
              children: [
                ...wasteTypes.map(
                  (option) => singleWasteType(
                    icon: option['icon'] ?? '',
                    title: option['title'] ?? '',
                    selected:
                        selectedItemsWithQuantity.containsKey(option['title']),
                    onTap: () {
                      if (selectedItemsWithQuantity
                          .containsKey(option['title'])) {
                        selectedItemsWithQuantity.remove(option['title']);
                      } else {
                        selectedItemsWithQuantity[option['title'] ?? ''] = 1;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Visibility(
                  visible: selectedItemsWithQuantity.isNotEmpty,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          showSubHeaderText(text: 'Selected Type(s)'),
                          showSubHeaderText(text: 'Quantity'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ...selectedItemsWithQuantity.entries.map(
                        (entry) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key,
                                  style: const TextStyle(
                                      color: AppColors.darkBlueText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                QuantitySelector(
                                  value: entry.value,
                                  onAddTap: () {
                                    setState(() {
                                      selectedItemsWithQuantity[entry.key] =
                                          entry.value + 1;
                                    });
                                  },
                                  onMinusTap: () {
                                    setState(() {
                                      if (entry.value - 1 < 0) {
                                        return;
                                      } else if (entry.value - 1 == 0) {
                                        selectedItemsWithQuantity
                                            .remove(entry.key);
                                      } else {
                                        selectedItemsWithQuantity[entry.key] =
                                            entry.value - 1;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              enabled: selectedItemsWithQuantity.isNotEmpty,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context,
                    screen: SelectTimeAndDatePage(
                      selectedItemsWithQuantity: selectedItemsWithQuantity,
                    ));
              },
              child: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }

  Widget singleWasteType({
    required String icon,
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
                color: selected ? AppColors.primary50 : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: selected
                        ? AppColors.primary100
                        : Colors.grey.shade200)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(icon),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.darkBlueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                AppCheckBoxWidget(selected: selected),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showSubHeaderText(
      {required String text, bool hasBottomPadding = true}) {
    return Text(
      text,
      style: const TextStyle(
          color: AppColors.darkBlueText,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
