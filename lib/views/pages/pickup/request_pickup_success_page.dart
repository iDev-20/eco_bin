import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_images.dart';
import 'package:waste_management_app/resources/app_page.dart';

class RequestPickupSuccessPage extends StatefulWidget {
  const RequestPickupSuccessPage({super.key});

  @override
  State<RequestPickupSuccessPage> createState() =>
      RequestPickupSuccessStatePage();
}

class RequestPickupSuccessStatePage extends State<RequestPickupSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      hideAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(image: AppImages.successLogo)),
                const Text(
                  'Request Successful',
                  style: TextStyle(
                      color: AppColors.darkBlueText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Your pickup request has been scheduled',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.darkBlueText),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              onTap: () {
                Navigation.navigateToScreen(context: context, screen: const NavigationHostPage());
              },
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
