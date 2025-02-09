import 'package:flutter/material.dart';

class PageDivider extends StatelessWidget {
  const PageDivider({super.key, this.height, this.thickness, this.color});

  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          height: 1,
          thickness: 0,
          color: Colors.green,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
