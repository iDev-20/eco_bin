import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/constants.dart';
import 'package:waste_management_app/resources/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AbsorbPointer(
        absorbing: false,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                                const Text(
                                  'Login with your Ghana mobile number',
                                  style: TextStyle(
                                      color: AppColors.darkBlueText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5.0),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'Your mobile number may be verified against your Ghana Card details',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  height: 36,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.splashScreenGreen)),
                                  child: TextField(
                                    cursorColor: AppColors.splashScreenGreen,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: kTextFieldInputDecoration,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PrimaryButton(
                    onTap: () {
                      Navigation.navigateToHomePage(context: context);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
