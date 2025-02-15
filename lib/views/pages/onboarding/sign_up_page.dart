import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/form_fields.dart';
import 'package:waste_management_app/resources/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';
import 'package:waste_management_app/views/pages/onboarding/verify_phone_number_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
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
                          const SizedBox(
                            height: 100,
                            width: 100,
                            child: Image(
                              image: AssetImage('assets/images/logo.png'),
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
                                    color: AppColors.splashScreenGreen,
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
                          const Text(
                            'Sign up with your Ghana mobile number',
                            style: TextStyle(
                                color: AppColors.darkBlueText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
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
                          const SizedBox(height: 16.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              children: [
                                PrimaryTextFormField(
                                  hintText: 'Enter your phone number',
                                  keyboardType: TextInputType.phone,
                                  // prefixText: '+233 ',
                                  controller: phoneNumberController,
                                  maxLength: 10,
                                  onChanged: (c) {
                                    setState(() {});
                                  },
                                ),
                                PrimaryTextFormField(
                                  height: 36.0,
                                  hintText: 'Enter password',
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
                      onTap: () {
                        Navigation.navigateToScreen(
                            context: context,
                            screen: const VerifyPhoneNumberPage(
                              phoneNumber: '',
                            ));
                      },
                      child: const Text('Sign up'),
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
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context, screen: const LoginPage());
                        },
                        child: const Text(
                          'Login',
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
