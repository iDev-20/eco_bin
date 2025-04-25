import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/widgets/page_divider.dart';

class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppPageSecondary(
      title: AppStrings.reportAnIssue,
      body: Column(
        children: [
          const PageDividerSecondary(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LongTextFormField(
                labelText: AppStrings.tellUsAboutYourIssue,
                hintText: AppStrings.enterDescription,
                controller: descriptionController,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (c) {
                  setState(() {
                    c;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              enabled: descriptionController.text.isNotEmpty,
              child: const Text('Report Issue'),
            ),
          ),
        ],
      ),
    );
  }
}
