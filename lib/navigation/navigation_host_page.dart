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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: getScreen(currentPage)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        height: 89,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            currentPage == 0
                ? selectedBottomNavIcon(
                    icon: Icons.home,
                    text: 'Home',
                    onPressed: () {
                      setState(() {
                        currentPage = 0;
                      });
                    })
                : unselectedBottomNavIcon(
                    icon: Icons.home,
                    text: 'Home',
                    onPressed: () {
                      setState(() {
                        currentPage = 0;
                      });
                    }),
            currentPage == 1
                ? selectedBottomNavIcon(
                    icon: Icons.restore_from_trash_rounded,
                    text: 'Bins',
                    onPressed: () {
                      setState(() {
                        currentPage = 1;
                      });
                    })
                : unselectedBottomNavIcon(
                    icon: Icons.restore_from_trash_rounded,
                    text: 'Bins',
                    onPressed: () {
                      setState(() {
                        currentPage = 1;
                      });
                    }),
            currentPage == 2
                ? selectedBottomNavIcon(
                    icon: Icons.receipt_long_rounded,
                    text: 'Transactions',
                    onPressed: () {
                      setState(() {
                        currentPage = 2;
                      });
                    })
                : unselectedBottomNavIcon(
                    icon: Icons.receipt_long_rounded,
                    text: 'Transactions',
                    onPressed: () {
                      setState(() {
                        currentPage = 2;
                      });
                    }),
            currentPage == 3
                ? selectedBottomNavIcon(
                    icon: Icons.person_rounded,
                    text: 'Profile',
                    onPressed: () {
                      setState(() {
                        currentPage = 3;
                      });
                    })
                : unselectedBottomNavIcon(
                    icon: Icons.person_rounded,
                    text: 'Profile',
                    onPressed: () {
                      setState(() {
                        currentPage = 3;
                      });
                    }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[700],
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget getScreen(int value) {
    switch (value) {
      case 0:
        return const HomePage();
      case 1:
        return const BinsPage();
      case 2:
        return const TransactionsPage();
      case 3:
        return const ProfilePage();
    }
    return const SizedBox();
  }

  Widget selectedBottomNavIcon({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: IconButton(
              color: Colors.green[700],
              onPressed: onPressed,
              icon: Icon(icon, size: 30),
            ),
          ),
          Text(text, style: TextStyle(color: Colors.green[700], fontSize: 13)),
        ],
      ),
    );
  }

  Widget unselectedBottomNavIcon({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 30),
          ),
          Text(text, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}
