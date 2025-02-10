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
                        children: const [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome to ',
                                style: TextStyle(
                                    color: AppColors.darkBlueText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Eco',
                                style: TextStyle(
                                    color: AppColors.splashScreenGreen,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                'Bin',
                                style: TextStyle(
                                    color: AppColors.darkBlueText,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                          Text(
                            'Sign up with your Ghana mobile number',
                            style: TextStyle(
                                color: AppColors.darkBlueText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5.0),
                          Padding(
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
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: PrimaryTextFormField(
                              hintText: 'Enter your phone number',
                              keyboardType: TextInputType.phone,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: PrimaryButton(
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
