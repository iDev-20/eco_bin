// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/models/shared_prefs.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';
import 'package:waste_management_app/views/pages/onboarding/role_selection_page.dart';
// import 'package:waste_management_app/views/pages/onboarding/sign_up_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await SharedPrefs.isLoggedIn();
    if (isLoggedIn) {
      Navigation.navigateToScreen(
          context: context, screen: const NavigationHostPage());
    } else {
      final prefs = await SharedPreferences.getInstance();
      final phoneNumber = prefs.getString('phoneNumber');
      final password = prefs.getString('password');

      Widget destination = (phoneNumber != null && password != null)
          ? const LoginPage()
          : const RoleSelectionPage();

      Navigation.navigateToScreen(context: context, screen: destination);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 172,
              width: 172,
              child: Image(
                image: AppImages.appLogo,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eco',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 55,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Bin',
                  style: TextStyle(
                      color: AppColors.darkBlueText,
                      fontSize: 55,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const Text(
              'Smart Waste, Clean Future',
              style: TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
