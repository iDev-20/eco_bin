import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_success_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigation.navigateToScreen(
          context: context, screen: const RequestPickupSuccessPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: AppColors.primaryColor,
          size: 100,
        ),
      ),
    );
  }
}
