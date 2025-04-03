import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/household%20onboarding/household_login_page.dart';
import 'package:waste_management_app/views/pages/onboarding/verify_phone_number_page.dart';

class CollectorSignUpPage extends StatefulWidget {
  const CollectorSignUpPage({super.key});

  @override
  State<CollectorSignUpPage> createState() => CollectorSignUpPageState();
}

class CollectorSignUpPageState extends State<CollectorSignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
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
                          const Text(
                            AppStrings.signUpWithYourGhanaMobileNumber,
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
                              AppStrings
                                  .yourMobileNumberMayBeVerifiedAgainstGHCard,
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
                                  height: 36.0,
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
                                  height: 36.0,
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
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigation.navigateToScreen(
                              context: context,
                              screen: const HouseholdLoginPage());
                        },
                        child: const Text(
                          AppStrings.login,
                          style: TextStyle(
                              color: AppColors.primaryColor,
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
