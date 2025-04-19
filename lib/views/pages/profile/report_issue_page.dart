import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
import 'package:waste_management_app/components/form_fields.dart';
import 'package:waste_management_app/resources/app_buttons.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
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
            PrimaryButton(
              enabled: descriptionController.text.isNotEmpty,
              child: const Text('Report Issue'),
            ),
          ],
        ),
      ),
    );
  }
}
