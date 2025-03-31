import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_images.dart';
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
    return AppPage(
        title: AppStrings.binsCaps,
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image(image: AppImages.binImage1),
            ),
            Container(
              height: 100,
              width: 100,
              child: Image(image: AppImages.binImage2),
            ),
            Container(
              height: 100,
              width: 100,
              child: Image(image: AppImages.binImage3),
            ),
          ],
        ));
  }
}
