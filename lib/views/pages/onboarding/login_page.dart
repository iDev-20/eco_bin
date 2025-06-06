// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/forgot_password_page.dart';
import 'package:waste_management_app/views/pages/onboarding/sign_up_page.dart';
import 'package:waste_management_app/widgets/app_dialogs_widgets.dart';

class LoginPage extends StatefulWidget {
  final String? role;
  const LoginPage({super.key, this.role});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
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
                                  AppStrings.loginWithYourGhanaMobileNumber,
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
                                    AppStrings
                                        .yourMobileNumberMayBeVerifiedAgainstGHCard,
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
                                        hintText:
                                            AppStrings.enterYourPhoneNumber,
                                        keyboardType: TextInputType.phone,
                                        controller: phoneNumbercontroller,
                                        maxLength: 10,
                                        onChanged: (c) {
                                          setState(() {});
                                        },
                                      ),
                                      PrimaryTextFormField(
                                        // height: 36.0,
                                        hintText:
                                            AppStrings.enterYourPhonePassword,
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
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigation.navigateToScreen(
                                        context: context,
                                        screen: const ForgotPasswordPage());
                                  },
                                  child: const Text(
                                    AppStrings.forgotPassword,
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
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
                      enabled: phoneNumbercontroller.text.length == 10.0 &&
                          passwordController.text.isNotEmpty,
                      onTap: () async {
                        String inputPhone = phoneNumbercontroller.text;
                        String inputPassword = passwordController.text;

                        final user = await SharedPrefs.getUser();

                        if (inputPhone == user['phoneNumber'] &&
                            inputPassword == user['password']) {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLoggedIn', true);
                          await prefs.setString('loggedInUser', inputPhone);

                          Navigation.navigateToScreen(
                              context: context,
                              screen: const NavigationHostPage());
                        } else {
                          showAlert(
                              context: context,
                              title: 'Login failed',
                              desc: AppStrings.invalidPhoneNumberOrPassword);
                        }
                      },
                      child: const Text(AppStrings.login),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            color: AppColors.darkBlueText,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context,
                              screen: SignUpPage(
                                role: widget.role ?? '',
                              ));
                        },
                        child: const Text(
                          AppStrings.signUp,
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
