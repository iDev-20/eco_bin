import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/reset_password_successful_page.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: AppImages.appLogo,
                                  ),
                                ),
                                const Text(
                                  AppStrings.setNewPassword,
                                  style: TextStyle(
                                      color: AppColors.darkBlueText,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5.0),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    "Set a password you won't lose this time",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Column(
                                    children: [
                                      PrimaryTextFormField(
                                        // height: 36.0,
                                        hintText: AppStrings.enterNewPassword,
                                        keyboardType:
                                            TextInputType.visiblePassword,
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
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        textInputAction: TextInputAction.done,
                                        controller: confirmPasswordController,
                                        obscureText: !isConfirmPasswordVisible,
                                        suffixWidget: IconButton(
                                          onPressed:
                                              toggleConfirmPasswordVisibility,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: PrimaryButton(
                      enabled: passwordController.text.isNotEmpty &&
                          confirmPasswordController.text.isNotEmpty,
                      onTap: () {
                        Navigation.navigateToScreen(
                            context: context,
                            screen: const ResetPasswordSucceddfulPage());
                      },
                      child: const Text(AppStrings.resetPassword),
                    ),
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
