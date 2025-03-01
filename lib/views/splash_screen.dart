import 'package:flutter/material.dart';
// import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/views/pages/onboarding/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1.9.toInt()),
      () {
        Navigation.navigateToScreen(
          context: context,
          screen: const LoginPage(),
        );
      },
    );
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
