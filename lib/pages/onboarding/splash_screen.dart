import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigation.navigateToScreen(
          context: context, screen: const NavigationHostPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 172,
              width: 172,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eco',
                  style: TextStyle(
                      color: AppColors.splashScreenGreen,
                      fontSize: 55,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Bin',
                  style: TextStyle(
                      color: AppColors.darkBlueText,
                      fontSize: 55,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            // RichText(
            //   text: const TextSpan(
            //     style: TextStyle(
            //         color: AppColors.splashScreenGreen,
            //         fontFamily: 'Nunito',
            //         fontSize: 55,
            //         fontWeight: FontWeight.w600),
            //     children: <TextSpan>[
            //       TextSpan(text: 'Eco'),
            //       TextSpan(
            //         text: 'Bin',
            //         style: TextStyle(
            //             color: AppColors.darkBlueText,
            //             fontFamily: 'Nunito',
            //             fontSize: 55,
            //             fontWeight: FontWeight.w600),
            //       ),
            //     ],
            //   ),
            // ),
            Text(
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
