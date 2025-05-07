import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  @override
  Widget build(BuildContext context) {
    return const AppPageSecondary(
      title: 'Volunteer Program',
      body: Center(
        child: Text(
          'Our volunteer program is coming soon!',
          style: TextStyle(
              color: AppColors.darkBlueText,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
