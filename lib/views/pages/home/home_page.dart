import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/home/components/tips_data.dart';
import 'package:waste_management_app/views/pages/home/faq_page.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String tipOfTheDay = '';
  String ecoFact = '';

  @override
  void initState() {
    super.initState();
    loadTipOfTheDay();
    loadEcoFact();
  }

  void loadEcoFact() {
    final random = Random();
    ecoFact = ecoFacts[random.nextInt(ecoFacts.length)];
  }

  Future<void> loadTipOfTheDay() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().systemDateFormat();

    final savedDate = prefs.getString('tip_date');
    final savedTip = prefs.getString('tip_text');

    if (savedDate == today && savedTip != null) {
      setState(() {
        tipOfTheDay = savedTip;
      });
    } else {
      final newTip = (dailyTips.toList()..shuffle()).first;
      await prefs.setString('tip_date', today);
      await prefs.setString('tip_text', newTip);
      setState(() {
        tipOfTheDay = newTip;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.homeCaps,
      body: Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            loadEcoFact;
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const Text(
                'Hello, Jermaine 👋',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'Ready to keep your space clean today?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  singleButton(
                    title: 'Request Pickup',
                    onTap: () {
                      Navigation.navigateToScreen(
                          context: context, screen: const RequestPickupPage());
                    },
                  ),
                  const SizedBox(width: 10),
                  singleButton(
                    title: 'Find Bin',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  singleButton(
                    title: 'Pickup History',
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  singleButton(
                    title: 'Get Help',
                    onTap: () {
                      Navigation.navigateToScreen(
                          context: context, screen: const FAQPage());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              updateSection(
                  icon: '🔄',
                  title: 'Upcoming Pickup',
                  detail: 'Organic Waste'),
              updateSection(
                  icon: '🗓️',
                  title: 'Scheduled',
                  detail: DateTime.now().friendlyDateTime()),
              updateSection(icon: '📍', title: 'Location', detail: 'Home'),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text('💡'),
                  SizedBox(width: 8),
                  Text(
                    'Tip of the day: ',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                tipOfTheDay,
                style: const TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "📆 Today's Waste Reminder ",
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              const Text(
                '♻️ Tuesday is Organic Waste Day!',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                '🧠 Quick Eco Fact',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                ecoFact,
                style: const TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '📦 Waste Categories',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  singleTip(
                    title: '♻️ Recyclables',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  singleTip(
                    title: '🍃 Organic',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  singleTip(
                    title: '🗑️ General',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                '(Tap for disposal tips)',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '📸 Recent Activity',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Requested pickup - Pending',
                style: TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Reported bin overflow',
                style: TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Viewed payment history',
                style: TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '📞 Emergency Contact',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                '📱 City Waste Hotline: 1234',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text(
                '📢 Announcement',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'New bins added in East Legon!',
                style: TextStyle(
                  color: AppColors.darkBlueText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget singleButton({required String title, required Function() onTap}) {
    return Expanded(
      child: Material(
        elevation: 2,
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: const Border(
                top: BorderSide(color: AppColors.primaryColor, width: 0.8),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Widget updateSection(
      {required String icon, required String title, required String detail}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(icon),
          const SizedBox(width: 8),
          Text(
            '$title: ',
            style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
          Text(
            detail,
            style: const TextStyle(
              color: AppColors.darkBlueText,
            ),
          ),
        ],
      ),
    );
  }

  Widget singleTip({required String title, required Function() onTap}) {
    return Expanded(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
              border: const Border(
                top: BorderSide(color: AppColors.primaryColor, width: 0.8),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.darkBlueText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
