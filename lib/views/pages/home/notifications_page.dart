import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<LatestUpdates> updates = [
    LatestUpdates(
        icon: Iconsax.trash,
        heading: AppStrings.scheduledWasteCollection,
        time: DateTime.now().fullFriendlyDate(),
        update: AppStrings.sampleScheduledWasteUpdate),
    LatestUpdates(
        icon: Iconsax.cloud_cross,
        heading: AppStrings.serviceDelayWeather,
        time: DateTime.now().fullFriendlyDate(),
        update: AppStrings.sampleServiceDelayUpdate),
    LatestUpdates(
        icon: Iconsax.close_circle,
        heading: AppStrings.missedCollection,
        time: DateTime.now().fullFriendlyDate(),
        update: AppStrings.sampleMissedCollectionDelay),
    LatestUpdates(
        icon: Iconsax.calendar_remove,
        heading: AppStrings.noCollectionPublicHoliday,
        time: DateTime.now().fullFriendlyDate(),
        update: AppStrings.sampleNoCollectionUpdate),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Notifications',
      body: Column(
        children: [
          const PageDivider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                padding: const EdgeInsets.only(top: 8.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...updates.map(
                          (e) => updateCard(e),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget updateCard(LatestUpdates update) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: BoxDecoration(
            // color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(16.0),
            border: const Border(
                bottom: BorderSide(
              color: AppColors.darkBlueText,
            ))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: AppColors.darkBlueText),
              ),
              child: Icon(update.icon),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    update.heading,
                    style: const TextStyle(
                        color: AppColors.darkBlueText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    update.time,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    update.update,
                    style: const TextStyle(color: AppColors.darkBlueText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
