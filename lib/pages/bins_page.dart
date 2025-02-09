import 'package:flutter/material.dart';

class BinsPage extends StatefulWidget {
  const BinsPage({super.key});

  @override
  State<BinsPage> createState() => _BinsPageState();
}

class _BinsPageState extends State<BinsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Bins page',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
