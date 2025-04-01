import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_dialogs.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class AppPage extends StatelessWidget {
  final String title;
  final Widget body;
  final Function(String, String, String)? addBin;
  const AppPage(
      {super.key, required this.title, required this.body, this.addBin});

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
                      actionButton(title, context),
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

  Widget actionButton(String title, BuildContext context) {
    final bool isBinsPage = title == AppStrings.binsCaps;
    return GestureDetector(
      onTap: () async {
        isBinsPage
            ? await showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AddBinAlertDialog(addBin: addBin, context: context);
                },
              )
            : Container();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Icon(isBinsPage ? Icons.add : Iconsax.message,
                color: Colors.white, size: 20),
            const SizedBox(width: 4),
            Text(
              isBinsPage ? 'Add Bin' : AppStrings.gethelp,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}