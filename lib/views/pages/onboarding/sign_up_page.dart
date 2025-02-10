import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to '),
                Text(
                  'Eco',
                  style: TextStyle(
                      color: AppColors.splashScreenGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Bin',
                  style: TextStyle(
                      color: AppColors.darkBlueText,
                      fontSize: 16,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Are you proud of yourself for not  an account?'),
          ],
        ),
      ),
    );
  }
}
