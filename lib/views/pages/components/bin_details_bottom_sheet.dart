import 'package:flutter/material.dart';

class BinDetailsBottomSheet extends StatefulWidget {
  const BinDetailsBottomSheet({super.key});

  @override
  State<BinDetailsBottomSheet> createState() => _BinDetailsBottomSheetState();
}

class _BinDetailsBottomSheetState extends State<BinDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
      ],
    );
  }
}