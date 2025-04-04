import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/views/pages/home/chatbot_page.dart';
import 'package:waste_management_app/views/pages/home/components/faq_data.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: 'Help and Support',
      body: Theme(
        data: Theme.of(context).copyWith(
            listTileTheme: ListTileTheme.of(context)
                .copyWith(dense: true, minVerticalPadding: 0.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frequently asked questions',
                style: TextStyle(
                    color: AppColors.darkBlueText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faqCategory.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      tilePadding: const EdgeInsets.all(0),
                      title: Text(
                        faqCategory[index],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      children: [
                        if (faqCategory[index] == 'General')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              questionAndAnswer(currentindex: index),
                              questionAndAnswer(currentindex: 1),
                              questionAndAnswer(currentindex: 2),
                            ],
                          ),
                        if (faqCategory[index] == 'Waste Collection')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              questionAndAnswer(currentindex: 3),
                              questionAndAnswer(currentindex: 4),
                              questionAndAnswer(currentindex: 5),
                            ],
                          ),
                        if (faqCategory[index] == 'Bin Management')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              questionAndAnswer(currentindex: 6),
                              questionAndAnswer(currentindex: 7),
                              questionAndAnswer(currentindex: 8),
                            ],
                          ),
                        if (faqCategory[index] == 'Payments')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              questionAndAnswer(currentindex: 9),
                              questionAndAnswer(currentindex: 10),
                              questionAndAnswer(currentindex: 11),
                            ],
                          ),
                        if (faqCategory[index] == 'Troubleshooting')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              questionAndAnswer(currentindex: 12),
                              questionAndAnswer(currentindex: 13),
                              questionAndAnswer(currentindex: 14),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigation.navigateToScreen(context: context, screen: const ChatbotPage());
        },
        label: const Row(
          children: [
            Icon(Iconsax.message),
            SizedBox(width: 8),
            Text(
              'Chat with us',
              style: TextStyle(color: AppColors.white, fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget questionAndAnswer({required int currentindex}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            faqData[currentindex]['question'] ?? '',
            style: const TextStyle(
                color: AppColors.darkBlueText, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 3),
          Text(
            faqData[currentindex]['answer'] ?? '',
            style: const TextStyle(color: AppColors.darkBlueText),
          ),
        ],
      ),
    );
  }
}
