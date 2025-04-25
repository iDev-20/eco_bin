import 'package:flutter/material.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
// import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  // bool hasProfilePhoto = false;

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: AppStrings.accountDetails,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PageDividerSecondary(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 42,
                    // backgroundImage: AppImages.profileImage,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppStrings.editProfilePhoto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const PrimaryTextFormField(
                  bottomPadding: 8,
                  labelText: 'Name',
                  hintText: 'Nana Kwame',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                ),
                const PrimaryTextFormField(
                  bottomPadding: 8,
                  labelText: 'Phone Number',
                  hintText: '0543571590',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
                const PrimaryTextFormField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: PrimaryButton(
              child: Text('Save Details'),
            ),
          ),
        ],
      ),
    );
  }
}
