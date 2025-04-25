import 'package:flutter/material.dart';
import 'package:waste_management_app/components/page_indicator.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_success_page.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';
import 'package:waste_management_app/models/ui_models.dart';

class RequestPickupSummaryPage extends StatefulWidget {
  const RequestPickupSummaryPage(
      {super.key,
      this.selectedItems,
      this.selectedDate,
      this.selectedTime,
      this.selectedAddress});

  final List? selectedItems;
  final DateTime? selectedDate;
  final String? selectedTime;
  final SavedAddress? selectedAddress;

  @override
  State<RequestPickupSummaryPage> createState() =>
      _RequestPickupSummaryPageState();
}

class _RequestPickupSummaryPageState extends State<RequestPickupSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Pickup Summary',
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(index: 3, length: 4),
                SizedBox(height: 16),
                Text(
                  'Please review your pickup request',
                  style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
                  decoration: const BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pickup Details',
                            style: TextStyle(
                                color: AppColors.darkBlueText,
                                fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: AppColors.primaryColor,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Edit details',
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      singleDetail(
                          icon: Iconsax.profile_circle,
                          detail: 'Jermaine Lamar'),
                      singleDetail(icon: Iconsax.call, detail: '0539424541'),
                      singleDetail(
                          icon: Iconsax.trash,
                          detail: widget.selectedItems?.isNotEmpty == true
                              ? (widget.selectedItems?.join(', ')) ?? ''
                              : 'No item selected'),
                      singleDetail(
                          icon: Iconsax.calendar,
                          detail: widget.selectedDate?.fullFriendlyDate() ??
                              'No date selected'),
                      singleDetail(
                          icon: Iconsax.clock,
                          detail: widget.selectedTime ?? 'No time selected'),
                      singleDetail(
                          icon: Iconsax.location,
                          detail: widget.selectedAddress?.address ??
                              'No address selected'),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: const BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    border: Border(
                      top: BorderSide(color: AppColors.grey200),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pickup Amount',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500)),
                      RichText(
                        text: const TextSpan(
                          text: 'GH₵ ',
                          style: TextStyle(
                              color: AppColors.darkBlueText,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: '20.00',
                              style: TextStyle(
                                  color: AppColors.darkBlueText,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
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
          BackAndNextButton(onNextButtonTap: () {
            Navigation.navigateToScreen(
                context: context, screen: const RequestPickupSuccessPage());
          })
        ],
      ),
    );
  }

  Widget singleDetail({IconData? icon, required String detail}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Visibility(
              visible: icon != null,
              child: Icon(icon, color: Colors.grey.shade700, size: 18)),
          const SizedBox(width: 4),
          Text(
            detail,
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.w600
                // fontSize: 13,
                ),
          ),
        ],
      ),
    );
  }
}
