import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/burger.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(100),
              BlendMode.darken,
            ),
          ),
        ),
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brand",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withAlpha(100),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 2.h),
              Text(
                "Savor the convenience of restaurant-quality meals.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white.withAlpha(150),
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                "delivered promptly.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white.withAlpha(150),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 3.h),
              TextButton(
                onPressed: () {
                  Get.to(() => const IntroductionScreen());
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: Size(85.w, 6.h),
                ),
                child: Text("NEXT"),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
