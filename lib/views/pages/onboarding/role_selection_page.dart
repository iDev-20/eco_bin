// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/views/pages/onboarding/sign_up_page.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  void navigateToNextScreen(BuildContext context, String role) {
    // Navigate based on role
    if (role == 'Household') {
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your role',
              style: TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            RoleCard(
              icon: Icons.home,
              title: "Household",
              description: "Manage your waste pickups easily.",
              onTap: () => navigateToNextScreen(context, "Household"),
            ),
            //Coming later
            // RoleCard(
            //   icon: Icons.business,
            //   title: "Business",
            //   description: "Keep your workplace waste-free.",
            //   onTap: () => navigateToNextScreen(context, "Business"),
            // ),
            RoleCard(
              icon: Icons.local_shipping,
              title: "Collector",
              description: "Pick up and manage waste requests.",
              onTap: () => navigateToNextScreen(context, "Collector"),
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
  final Function() onTap;

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
