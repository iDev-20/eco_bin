import 'package:flutter/material.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/bins_page.dart';
import 'package:waste_management_app/views/pages/home_page.dart';
import 'package:waste_management_app/views/pages/profile_page.dart';
import 'package:waste_management_app/views/pages/transactions_page.dart';
import 'package:waste_management_app/resources/app_colors.dart';

class NavigationHostPage extends StatefulWidget {
  const NavigationHostPage({super.key});

  @override
  State<NavigationHostPage> createState() => _NavigationHostPageState();
}

class _NavigationHostPageState extends State<NavigationHostPage> {
  int currentPage = 0;

  final List<Widget> pages = const [
    HomePage(),
    BinsPage(),
    TransactionsPage(),
    ProfilePage(),
  ];

  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'text': AppStrings.home},
    {'icon': Icons.restore_from_trash_rounded, 'text': AppStrings.bins},
    {'icon': Icons.receipt_long_rounded, 'text': AppStrings.transactions},
    {'icon': Icons.person_rounded, 'text': AppStrings.profile},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(navItems.length, (index) {
            return buildBottomNavIcon(
              icon: navItems[index]['icon'],
              text: navItems[index]['text'],
              isSelected: currentPage == index,
              onPressed: () => setState(() => currentPage = index),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget buildBottomNavIcon({
    required IconData icon,
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(16.0),
                  )
                : null,
            child: IconButton(
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              onPressed: onPressed,
              icon: Icon(icon, size: 30),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
