import 'package:flutter/material.dart';
import 'package:waste_management_app/pages/onboarding/splash_screen.dart';
import 'package:waste_management_app/resources/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoBin',
      theme: ThemeData(
          fontFamily: 'Nunito',
          useMaterial3: false,
          primaryColor: AppColors.primaryGreen,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: AppColors.primaryGreen,
            elevation: 0,
          )),
      home: const SplashScreen(),
    );
  }
}
