// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/views/pages/onboarding/sign_up_page.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  void navigateToNextScreen(BuildContext context, String role) {
    // Navigate based on role
    if (role == 'User') {
      Navigation.navigateToScreen(
          context: context,
          screen: SignUpPage(
            role: role,
          ));
    }
    //Coming later
    // else if (role == 'Business') {
    //   Navigation.navigateToScreen(
    //       context: context,
    //       screen: SignUpPage(
    //         role: role,
    //       ));
    // }
    else if (role == 'Collector') {
      Navigation.navigateToScreen(
          context: context,
          screen: SignUpPage(
            role: role,
          ));
    }
    print("Selected Role: $role");
    // Use Navigator.push to take the user to the next page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              'Select your role',
              style: TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, top: 30.0, right: 50.0, bottom: 100.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  roleContainer(
                    role: 'User',
                    onTap: () => navigateToNextScreen(context, 'User'),
                  ),
                  roleContainer(
                    role: 'Collector',
                    description: 'Coming Soon',
                    onTap: () {},
                  ),
                  // RoleCard(
                  //   icon: Icons.home,
                  //   title: "Household",
                  //   description: "Manage your waste pickups easily.",
                  //   onTap: () => navigateToNextScreen(context, "Household"),
                  // ),
                  // //Coming later
                  // // RoleCard(
                  // //   icon: Icons.business,
                  // //   title: "Business",
                  // //   description: "Keep your workplace waste-free.",
                  // //   onTap: () => navigateToNextScreen(context, "Business"),
                  // // ),
                  // RoleCard(
                  //   icon: Icons.local_shipping,
                  //   title: "Collector",
                  //   description: "Pick up and manage waste requests.",
                  //   onTap: () => navigateToNextScreen(context, "Collector"),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget roleContainer(
      {required String role,
      required VoidCallback onTap,
      String? description}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 110),
        decoration: BoxDecoration(
          color: AppColors.primary50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Column(
          children: [
            Text(
              role,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const RoleCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40, color: AppColors.primaryColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: AppColors.darkBlueText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
