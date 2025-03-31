import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class AppPage extends StatelessWidget {
  final String title;
  final Widget body;
  const AppPage({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 36.0,
                            width: 36.0,
                            child: Image(
                              image: AppImages.appLogo,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            title,
                            style: const TextStyle(
                                color: AppColors.darkBlueText,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(Iconsax.message,
                                color: Colors.white, size: 20),
                            SizedBox(width: 6),
                            Text(
                              AppStrings.gethelp,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const PageDivider(),
            body
          ],
        ),
      ),
    );
  }
}
