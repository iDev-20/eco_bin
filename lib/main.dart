import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/splash_screen.dart';
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
      title: AppStrings.appName,
      theme: ThemeData(
        fontFamily: 'Nunito',
        useMaterial3: false,
        primaryColor: AppColors.primaryColor,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
            elevation: 0,
            padding: EdgeInsets.only(top: 12.0),
            color: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            height: 89),
      ),
      home: const NavigationHostPage(),
    );
  }
}
