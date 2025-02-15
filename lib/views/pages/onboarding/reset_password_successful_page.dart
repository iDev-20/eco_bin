import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';

class ResetPasswordSucceddfulPage extends StatelessWidget {
  const ResetPasswordSucceddfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 150,
                color: AppColors.splashScreenGreen,
              ),
              const SizedBox(height: 16),
              const Text(
                'Password Reset Successful!',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hooray🥳, your password has been reset \nsuccessfully',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              PrimaryButton(
                onTap: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const LoginPage());
                },
                child: const Text('Back to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
