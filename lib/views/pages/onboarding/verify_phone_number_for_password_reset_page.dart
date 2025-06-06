import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/components/otp_input.dart';
import 'package:waste_management_app/views/pages/onboarding/set_new_password_page.dart';

class VerifyPhoneNumberForPasswordResetPage extends StatefulWidget {
  const VerifyPhoneNumberForPasswordResetPage(
      {super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerifyPhoneNumberForPasswordResetPage> createState() =>
      _VerifyPhoneNumbeForrPasswordResetPageState();
}

class _VerifyPhoneNumbeForrPasswordResetPageState
    extends State<VerifyPhoneNumberForPasswordResetPage> {
  bool wrongOtp = false;

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image(
                        image: AppImages.appLogo,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      AppStrings.passwordReset,
                      style: TextStyle(
                        color: AppColors.darkBlueText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text.rich(
                      TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Enter the verification code sent to ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text: "\n+23320621770",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkBlueText,
                            ))
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 55.0,
                        width: (55.0 * 4.3) + 12,
                        child: OtpInput(
                          autoFocus: true,
                          controller: otpController,
                          onChanged: (val) {
                            setState(() {});
                            if (otpController.text.length == 4) {
                              Navigation.navigateToScreen(
                                  context: context,
                                  screen: const SetNewPasswordPage());
                            }
                          },
                          wrongOtp: wrongOtp,
                          onSubmit: (val) {
                            Navigation.navigateToScreen(
                                context: context,
                                screen: const SetNewPasswordPage());
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        AppStrings.resendCode,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // const Text(
                    //   'This code will expire in 5 minutes.',
                    //   style: TextStyle(
                    //     color: AppColors.grey400,
                    //     fontSize: AppDimens.normalFontSize,
                    //    ),
                    // ),
                    // const SizedBox(
                    //   height: AppDimens.defaultMarginSmall,
                    // ),
                    //  Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     InkWell(
                    //       onTap: (){
                    //       },
                    //       child: const Text(
                    //         'Resend code',
                    //         style: TextStyle(
                    //           color: AppColors.primaryColor,
                    //           fontSize: AppDimens.normalFontSize,
                    //           fontWeight: FontWeight.w500,
                    //           decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 28.0),
            child: PrimaryButton(
              // enabled: otpController.text.length == 4,
              onTap: () {
                Navigation.navigateToScreen(
                    context: context, screen: const SetNewPasswordPage());
              },
              child: const Text(AppStrings.submit),
            ),
          ),
        ],
      ),
    );
  }
}


                        // const Text.rich(
                        //   TextSpan(children: <TextSpan>[
                        //     TextSpan(
                        //       text: "Resend code in ",
                        //       style: TextStyle(
                        //         color: Colors.grey,
                        //       ),
                        //     ),
                        //     TextSpan(
                        //         text: "01:00",
                        //         style: TextStyle(
                        //             color: AppColors.darkBlueText,
                        //             fontWeight: FontWeight.bold))
                        //   ]),
                        // ),
