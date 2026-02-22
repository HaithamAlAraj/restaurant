import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/views/widgets/category_button.dart';
import 'package:restaurant/views/widgets/home_part_title.dart';
import 'package:restaurant/views/widgets/popular_card.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
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
              SizedBox(height: 2.5.h),
              const HomePartTitle(title: "Popular this week"),
              SizedBox(height: 2.5.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularCard(
                      imagePath: "assets/images/cheese_burger.png",
                      title: "Cheese Burger",
                      description: "Cheesy Heaven",
                      price: 5.99,
                      isFavorite: false,
                      onFavoriteToggle: () {},
                      onAddToCart: () {},
                    ),
                    SizedBox(width: 5.w),
                    PopularCard(
                      imagePath: "assets/images/chicken_sandwich.png",
                      title: "Chicken Sandwich",
                      description: "Popeyes what",
                      price: 3.59,
                      isFavorite: false,
                      onFavoriteToggle: () {},
                      onAddToCart: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              CarouselSlider(
                options: CarouselOptions(
                  height: 18.h,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items:
                    [
                      "assets/images/carousel1.jpg",
                      "assets/images/carousel2.jpg",
                      "assets/images/carousel3.jpg",
                    ].map((imagePath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: 2.5.h),
            ],
          ),
        ),
      ),
    );
  }
}
