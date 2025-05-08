// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/user_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
// import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';
import 'package:waste_management_app/views/pages/profile/accounts_page.dart';
import 'package:waste_management_app/views/pages/profile/address_page.dart';
import 'package:waste_management_app/views/pages/profile/report_issue_page.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.phoneNumber});

  final String? phoneNumber;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    loadPhoneNumber();
  }

  void loadPhoneNumber() async {
    String phoneNumber = await SharedPrefs.getPhoneNumber();
    setState(() {
      _phoneNumber = phoneNumber;
    });
  }

  String avatarUrl = 'https://api.dicebear.com/9.x/<lorelei>/svg';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName ?? '';
    final userEmail = userProvider.userEmail ?? '';

    return AppPage(
      title: AppStrings.profileCaps,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  // backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                          color: AppColors.darkBlueText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      _phoneNumber,
                      style: const TextStyle(
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
                    context: context,
                    screen: AccountsPage(
                      userName: userName,
                      userEmail: userEmail,
                      phoneNumber: _phoneNumber,
                    ));
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
              onTap: () async {
                await showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AppAlertDialog(
                      title: 'Log Out',
                      desc: 'Are you sure you want to log out?',
                      firstOption: 'No',
                      onFirstOptionTap: () {
                        Navigation.back(context: context);
                      },
                      secondOption: 'Yes, log out',
                      onSecondOptionTap: () async {
                        await SharedPrefs.logout();

                        Navigation.navigateToScreenAndClearAllPrevious(
                            context: context, screen: const LoginPage());
                      },
                      borderColor: Colors.red,
                      backgroundColor: Colors.red,
                      textColor: Colors.red,
                    );
                  },
                );
              },
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
