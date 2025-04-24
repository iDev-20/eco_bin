import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';

class RequestPickupSummaryPage extends StatefulWidget {
  const RequestPickupSummaryPage({super.key});

  @override
  State<RequestPickupSummaryPage> createState() =>
      _RequestPickupSummaryPageState();
}

class _RequestPickupSummaryPageState extends State<RequestPickupSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Pickup Summary',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please review your pickup request',
              style: TextStyle(
                color: AppColors.darkBlueText,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pickup Details',
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            // fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
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
                                // fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  singleDetail(icon: Icons.location_on, detail: 'data'),
                  singleDetail(icon: Icons.location_on, detail: 'data'),
                  singleDetail(icon: Icons.location_on, detail: 'data'),
                  singleDetail(icon: Icons.location_on, detail: 'data'),
                  singleDetail(icon: Icons.location_on, detail: 'data'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pickup Amount',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          // fontSize: 13,
                          fontWeight: FontWeight.w500)),
                  RichText(
                    text: const TextSpan(
                      text: 'GHC ',
                      style: TextStyle(
                          color: AppColors.darkBlueText,
                          // fontSize: 13,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: '2000',
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
    );
  }

  Widget singleDetail({required IconData icon, required String detail}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 4),
          Text(
            detail,
            style: const TextStyle(
              color: AppColors.darkBlueText,
              // fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
