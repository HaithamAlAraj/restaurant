import 'package:flutter/material.dart';
import 'package:restaurant/views/widgets/circle_icon.dart';
import 'package:restaurant/views/widgets/favorite_card.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/user_profile.jpg",
            width: 100.w,
            height: 74.h,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.82,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Member gold",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Muhammad Dominguez",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Muhamad_dominquez@yahoo.com",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ],
                            ),
                            Spacer(),
                            CircleIcon(
                              color: Colors.blue,
                              icon: Icons.edit_outlined,
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Container(
                          width: 100.w,
                          height: 10.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 0.5.h,
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
                            children: [
                              Container(
                                width: 12.w,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "\$",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "You have 4 vouchers",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        Row(
                          children: [
                            Text(
                              "Favorite",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "See all",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h),
                        FavoriteCard(
                          imagePath: "assets/images/pizza.png",
                          itemName: "Pizza pepperoni",
                          price: 25.90,
                        ),
                        SizedBox(height: 2.5.h),
                        FavoriteCard(
                          imagePath: "assets/images/sushi.png",
                          itemName: "Philadelphia roll",
                          price: 8.98,
                        ),
                        SizedBox(height: 2.5.h),
                        FavoriteCard(
                          imagePath: "assets/images/noodles.png",
                          itemName: "Noodle",
                          price: 10,
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
