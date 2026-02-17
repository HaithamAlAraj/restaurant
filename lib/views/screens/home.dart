import 'package:flutter/material.dart';
import 'package:restaurant/views/widgets/category_button.dart';
import 'package:restaurant/views/widgets/home_part_title.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = const [
    "Deserts",
    "Vegetarian",
    "Meat",
    "Fruits",
  ];
  int selectedCategoryIndex = 0;

  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            const HomePartTitle(title: "Categories"),
            SizedBox(height: 2.5.h),
            SizedBox(
              height: 18.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    CategoryButton(
                      categoryName: categories[index],
                      isSelected: (index == selectedCategoryIndex),
                      onTap: () => selectCategory(index),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
