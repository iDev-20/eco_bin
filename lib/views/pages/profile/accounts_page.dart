import 'package:flutter/material.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
// import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/profile/profile_page.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.phoneNumber});

  final String userName;
  final String userEmail;
  final String phoneNumber;

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  // bool hasProfilePhoto = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                PrimaryTextFormField(
                  bottomPadding: 8,
                  labelText: 'Name',
                  hintText: widget.userName,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) {
                    setState(() {
                      nameController.text = value;
                    });
                  },
                ),
                PrimaryTextFormField(
                  bottomPadding: 8,
                  labelText: 'Phone Number',
                  hintText: widget.phoneNumber,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  enabled: false,
                ),
                PrimaryTextFormField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() {
                      emailController.text = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              onTap: () {
                // Save the details

                // You can add your save logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Details saved successfully!'),
                  ),
                );
                Navigation.navigateToScreen(
                  context: context,
                  screen: ProfilePage(
                    userName: nameController.text.isNotEmpty
                        ? nameController.text
                        : widget.userName,
                    userEmail: widget.userEmail,
                    phoneNumber: widget.phoneNumber,
                  ),
                );
              },
              child: const Text('Save Details'),
            ),
          ),
        ],
      ),
    );
  }
}
