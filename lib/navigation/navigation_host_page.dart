import 'package:flutter/material.dart';
import 'package:waste_management_app/pages/bins_page.dart';
import 'package:waste_management_app/pages/home_page.dart';
import 'package:waste_management_app/pages/profile_page.dart';
import 'package:waste_management_app/pages/transactions_page.dart';

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
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.restore_from_trash_rounded, 'text': 'Bins'},
    {'icon': Icons.receipt_long_rounded, 'text': 'Transactions'},
    {'icon': Icons.person_rounded, 'text': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 8.0,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        height: 89,
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
        backgroundColor: Colors.green[700],
        elevation: 0,
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
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(16.0),
                  )
                : null,
            child: IconButton(
              color: isSelected ? Colors.green[700] : Colors.grey,
              onPressed: onPressed,
              icon: Icon(icon, size: 30),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.green[700] : Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
