// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/home/faq_page.dart';
import 'package:waste_management_app/views/pages/home/notifications_page.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class AppPage extends StatelessWidget {
  final String title;
  final Widget body;
  final Function(String, String, String)? addBin;
  const AppPage(
      {super.key, required this.title, required this.body, this.addBin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AbsorbPointer(
        absorbing: false,
        child: Scaffold(
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
        ),
      ),
    );
  }

  Widget actionButton(String title, BuildContext context) {
    final bool isBinsPage = title == AppStrings.binsCaps;
    final bool isHomePage = title == AppStrings.homeCaps;
    return GestureDetector(
      onTap: () async {
        if (isHomePage) {
          Navigation.navigateToScreen(
              context: context, screen: const NotificationsPage());
        } else if (isBinsPage) {
          await showAdaptiveDialog(
            context: context,
            builder: (context) {
              return AddBinAlertDialog(addBin: addBin, context: context);
            },
          );
        } else {
          Navigation.navigateToScreen(
              context: context, screen: const FAQPage());
        }
      },
      child: isHomePage
          ? const SizedBox(
              height: 36,
              width: 36,
              child: Icon(
                Icons.notifications_rounded,
                color: AppColors.primaryColor,
                size: 25,
              ),
            )
          : Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
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

class AppPageSecondary extends StatelessWidget {
  final String? title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? hideAppBar;
  final List<Widget>? actions;
  const AppPageSecondary(
      {super.key,
      this.title,
      required this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.hideAppBar,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: (hideAppBar ?? false)
            ? null
            : AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigation.back(context: context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                title: Text(title ?? ''),
                titleTextStyle: const TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                centerTitle: true,
                actions: actions,
              ),
        body: SafeArea(child: body),
      ),
    );
  }
}
