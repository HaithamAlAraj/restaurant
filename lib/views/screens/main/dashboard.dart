import 'package:flutter/material.dart';
import 'package:restaurant/views/screens/main/basket.dart';
import 'package:restaurant/views/screens/main/chat.dart';
import 'package:restaurant/views/screens/main/home.dart';
import 'package:restaurant/views/screens/main/profile.dart';
import 'package:sizer/sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    BasketScreen(),
    ProfileScreen(),
    ChatScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
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
    );
  }
}
