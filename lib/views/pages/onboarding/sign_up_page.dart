// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';
import 'package:waste_management_app/views/pages/onboarding/verify_phone_number_page.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class SignUpPage extends StatefulWidget {
  final String role;
  const SignUpPage({super.key, required this.role});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController vehicleIDController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image(
                              image: AppImages.appLogo,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome to ',
                                style: TextStyle(
                                    color: AppColors.darkBlueText,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Eco',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Bin',
                                style: TextStyle(
                                    color: AppColors.darkBlueText,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Sign up as ${widget.role}',
                            // AppStrings.signUpWithYourGhanaMobileNumber,
                            style: const TextStyle(
                                color: AppColors.darkBlueText,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5.0),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              AppStrings
                                  .yourMobileNumberMayBeVerifiedAgainstGHCard,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                PrimaryTextFormField(
                                  // height: 36.0,
                                  hintText: AppStrings.enterYourPhoneNumber,
                                  keyboardType: TextInputType.phone,
                                  // prefixText: '+233 ',
                                  controller: phoneNumberController,
                                  maxLength: 10,
                                  onChanged: (c) {
                                    setState(() {});
                                  },
                                ),
                                PrimaryTextFormField(
                                  // height: 36.0,
                                  hintText: AppStrings.createPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  controller: passwordController,
                                  obscureText: !isPasswordVisible,
                                  suffixWidget: IconButton(
                                    onPressed: togglePasswordVisibility,
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onChanged: (c) {
                                    setState(() {});
                                  },
                                ),
                                PrimaryTextFormField(
                                  // height: 36.0,
                                  hintText: AppStrings.confirmPassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  controller: confirmPasswordController,
                                  obscureText: !isConfirmPasswordVisible,
                                  suffixWidget: IconButton(
                                    onPressed: toggleConfirmPasswordVisibility,
                                    icon: Icon(
                                      isConfirmPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onChanged: (c) {
                                    setState(() {});
                                  },
                                ),
                                //Coming later
                                // if (widget.role == 'Business') ...[
                                //   PrimaryTextFormField(
                                //     hintText: 'Business Name',
                                //     keyboardType: TextInputType.phone,
                                //     controller: businessNameController,
                                //     maxLength: 10,
                                //     onChanged: (c) {
                                //       setState(() {});
                                //     },
                                //   ),
                                //   PrimaryTextFormField(
                                //     hintText: 'Business Address',
                                //     keyboardType: TextInputType.phone,
                                //     controller: addressController,
                                //     maxLength: 10,
                                //     onChanged: (c) {
                                //       setState(() {});
                                //     },
                                //   ),
                                // ],
                                if (widget.role == 'Collector') ...[
                                  PrimaryTextFormField(
                                    height: 36.0,
                                    hintText: 'Vehicle ID',
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: vehicleIDController,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    // maxLength: 10,
                                    onChanged: (c) {
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: PrimaryButton(
                      enabled: phoneNumberController.text.length == 10.0 &&
                          passwordController.text.isNotEmpty,
                      onTap: () async {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          await SharedPrefs.saveUser(phoneNumberController.text,
                              passwordController.text);

                          Navigation.navigateToScreen(
                              context: context,
                              screen: VerifyPhoneNumberPage(
                                phoneNumber: phoneNumberController.text,
                              ));
                        } else {
                          showAlert(
                              context: context,
                              title: 'Password Mismatch',
                              desc:
                                  'The password and confirm password fields do not match. Please re-enter them carefully.');
                        }
                      },
                      child: const Text(AppStrings.signUp),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context,
                              screen: LoginPage(
                                role: widget.role,
                              ));
                        },
                        child: const Text(
                          AppStrings.login,
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
