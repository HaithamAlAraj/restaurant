import 'package:flutter/material.dart';
import 'package:restaurant/views/widgets/circle_icon.dart';
import 'package:restaurant/views/widgets/home_part_title.dart';
import 'package:restaurant/views/widgets/popular_card.dart';
import 'package:sizer/sizer.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/mcdonalds_cover.jpg",
            fit: BoxFit.cover,
            height: 40.h,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 0.7.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Popular",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Spacer(),
                            CircleIcon(
                              color: Colors.blue,
                              icon: Icons.location_on_rounded,
                            ),
                            SizedBox(width: 3.w),
                            CircleIcon(
                              color: Colors.blue,
                              icon: Icons.favorite_rounded,
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        HomePartTitle(title: "Mcdonald's"),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            CircleIcon(
                              color: Colors.black,
                              icon: Icons.location_on_rounded,
                            ),
                            SizedBox(width: 3.5.w),
                            Text("3 km"),
                            SizedBox(width: 6.w),
                            CircleIcon(
                              color: Colors.black,
                              icon: Icons.star_rate_rounded,
                            ),
                            SizedBox(width: 3.5.w),
                            Text("4.8 rating"),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Text(
                          "McDonald's is the world's largest fast food restaurant chain, serving over 69 million customers daily in over 100 countries in more than 40,000 outlets as of ...",
                          style: TextStyle(fontSize: 16.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            HomePartTitle(title: "Popular this week"),
                            Spacer(),
                            Text(
                              "See all",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        SingleChildScrollView(
                          clipBehavior: Clip.none,
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
                        SizedBox(height: 2.5.h),
                        Row(
                          children: [
                            HomePartTitle(title: "Testimonials"),
                            Spacer(),
                            Text(
                              "See all",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        Container(
                          width: 100.w,
                          height: 15.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withAlpha(100),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/user_testimonial.jpg",
                                ),
                                radius: 6.w,
                              ),
                              SizedBox(width: 6.w),
                              SizedBox(
                                width: 50.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ricky Martin",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "20.11.2023",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black.withAlpha(150),
                                      ),
                                    ),
                                    Text(
                                      "The food is very delicious and the service is best! love it!",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black.withAlpha(150),
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.blue,
                                    size: 4.w,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
