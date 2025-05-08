import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/providers/user_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
// import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';
import 'package:waste_management_app/widgets/back_and_next_button.dart';
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
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userName;
    phoneNumberController.text = widget.phoneNumber;
    emailController.text = widget.userEmail;
  }

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
                  hintText: 'Nana Kwame',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  enabled: isEditing,
                  // onChanged: (value) {
                  //   setState(() {
                  //     nameController.text = value;
                  //   });
                  // },
                ),
                PrimaryTextFormField(
                  bottomPadding: 8,
                  labelText: 'Phone Number',
                  hintText: '020357159',
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  enabled: isEditing,
                ),
                PrimaryTextFormField(
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  enabled: isEditing,
                  // onChanged: (value) {
                  //   setState(() {
                  //     emailController.text = value;
                  //   });
                  // },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: BackAndNextButton(
              onNextButtonTap: () {
                final newName = nameController.text.trim();
                final newPhone = phoneNumberController.text.trim();
                final newEmail = emailController.text.trim();

                if (newName.isEmpty || newEmail.isEmpty || newPhone.isEmpty) {
                  showAlert(
                      context: context,
                      title: 'Incomplete Information',
                      desc:
                          'Please fill in all the fields before saving your details.');
                  return;
                }

                if (newName == widget.userName &&
                    newPhone == widget.phoneNumber &&
                    newEmail == widget.userEmail) {
                  showAlert(
                      context: context,
                      title: 'No Changes Detected',
                      desc: "You haven't made any updates to your profile");
                  setState(() => isEditing = false);
                  return;
                }

                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                userProvider.userName = newName;
                userProvider.userPhoneNumber = newPhone;
                userProvider.userEmail = newEmail;

                showAlert(
                    context: context,
                    title: 'Profile Updated',
                    desc: 'Your account details have been saved successfully!');

                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Details saved successfully!')),
                // );

                // Exit edit mode
                setState(() {
                  isEditing = false;
                });
              },
              onNextButtonEnabled: isEditing,
              secondText: 'Save Details',
              onBackButtonTap: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
              onBackButtonEnabled: !isEditing,
              firstText: 'Edit Details',
              padding: const EdgeInsets.all(0.0),
            ),
          ),
        ],
      ),
    );
  }
}
