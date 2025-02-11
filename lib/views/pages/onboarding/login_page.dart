import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/form_fields.dart';
import 'package:waste_management_app/resources/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/forgot_password_page.dart';
import 'package:waste_management_app/views/pages/onboarding/sign_up_page.dart';
import 'package:waste_management_app/views/pages/onboarding/verify_phone_number_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumbercontroller = TextEditingController();

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
                                const SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                                const Text(
                                  'Login with your Ghana mobile number',
                                  style: TextStyle(
                                      color: AppColors.darkBlueText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5.0),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'Your mobile number may be verified against your Ghana Card details',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: PrimaryTextFormField(
                                    hintText: 'Enter your phone number',
                                    keyboardType: TextInputType.phone,
                                    controller: phoneNumbercontroller,
                                    onChanged: (c) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigation.navigateToScreen(
                                        context: context,
                                        screen: const ForgotPasswordPage());
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: AppColors.splashScreenGreen,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.left,
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
                      enabled: phoneNumbercontroller.text.length == 10.0,
                      onTap: () {
                        Navigation.navigateToScreen(
                            context: context,
                            screen: const VerifyPhoneNumberPage(
                              phoneNumber: '',
                            ));
                      },
                      child: const Text('Login'),
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
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context, screen: const SignUpPage());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColors.splashScreenGreen,
                              fontSize: 15.0,
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
