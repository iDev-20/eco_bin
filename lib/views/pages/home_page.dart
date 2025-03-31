import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.homeCaps,
      body: Expanded(
        child: ListView(
          padding: const EdgeInsets.only(top: 8.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  card(),
                  card(),
                  card(),
                  card(),
                  card(),
                  card(),
                  card(),
                  card(),
                  card(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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
              child: const Icon(Iconsax.trash),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scheduled waste collection',
                    style: TextStyle(
                        color: AppColors.darkBlueText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'February 7th, 2025',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Regular waste collection is on schedule. '
                    'Please ensure your bins are placed outside by 6AM',
                    style: TextStyle(color: AppColors.darkBlueText),
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
