import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';

class BinsPage extends StatefulWidget {
  const BinsPage({super.key});

  @override
  State<BinsPage> createState() => _BinsPageState();
}

class _BinsPageState extends State<BinsPage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(title: AppStrings.binsCaps, body: Column());
  }
}
