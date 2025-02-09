import 'package:flutter/material.dart';
import 'package:waste_management_app/navigation/navigation_host_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcoBin',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white
      ),
      home: const NavigationHostPage(),
    );
  }
}
