import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controllers/dashboard_provider.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashboardProvider, child) => Scaffold(
        body: dashboardProvider.pages[dashboardProvider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardProvider.selectedIndex,
          onTap: (index) => dashboardProvider.selectDashboardIndex(index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black.withAlpha(200),
          unselectedItemColor: Colors.black.withAlpha(100),
          iconSize: 21.sp,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: "Basket",
              activeIcon: Icon(Icons.shopping_basket),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile",
              activeIcon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: "Chat",
              activeIcon: Icon(Icons.chat_bubble),
            ),
          ],
        ),
      ),
    );
  }
}
