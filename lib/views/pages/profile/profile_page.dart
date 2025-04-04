import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/profile/accounts_page.dart';
import 'package:waste_management_app/views/pages/profile/address_page.dart';
import 'package:waste_management_app/views/pages/profile/report_issue_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.profileCaps,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  // backgroundImage: AppImages.profileImage,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jermaine Lamar Cole',
                      style: TextStyle(
                          color: AppColors.darkBlueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '0543571590',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            profileCard(
              title: 'Account',
              icon: Iconsax.profile_circle,
              trailingWidget: const Text(
                'Set your email',
                style: TextStyle(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const AccountsPage());
              },
            ),
            profileCard(
              title: 'Addresses',
              icon: Iconsax.location,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const AddressPage());
              },
            ),
            profileCard(
              title: 'Report an Isuue',
              icon: Iconsax.message,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const ReportIssuePage());
              },
            ),
            profileCard(
              title: 'Log out',
              icon: Iconsax.logout,
              titleColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget profileCard(
      {required String title,
      required IconData icon,
      required VoidCallback onTap,
      Widget? trailingWidget,
      Color? titleColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.only(left: 8, top: 12, right: 16, bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            // border: Border.all(color: AppColors.darkBlueText),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 18,
                width: 18,
                child: Icon(
                  icon,
                  size: 19,
                  color: titleColor == Colors.red ? Colors.red : Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: titleColor ?? AppColors.darkBlueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        trailingWidget ?? const SizedBox(),
                        const Icon(Icons.chevron_right_rounded,
                            color: AppColors.darkBlueText, size: 20)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
