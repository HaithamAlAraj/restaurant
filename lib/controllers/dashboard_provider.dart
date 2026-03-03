import 'package:flutter/material.dart';
import 'package:restaurant/views/screens/main/basket.dart';
import 'package:restaurant/views/screens/main/chat.dart';
import 'package:restaurant/views/screens/main/home.dart';
import 'package:restaurant/views/screens/main/profile.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    BasketScreen(),
    ProfileScreen(),
    ChatScreen(),
  ];
  final List<String> categories = const [
    "Deserts",
    "Vegetarian",
    "Meat",
    "Fruits",
  ];
  int selectedCategoryIndex = 0;
  final TextEditingController searchController = TextEditingController();

  void selectCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void selectDashboardIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
