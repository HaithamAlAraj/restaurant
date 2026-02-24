import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/views/screens/main/dashboard.dart';
import 'package:sizer/sizer.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Icon(Icons.check, size: 12.w, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Congrats!',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your password has been reset successfully.',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            Spacer(),
            GestureDetector(
              onTap: () => Get.offAll(() => const DashboardScreen()),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 6.w),
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                width: 100.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Text(
                  "NEXT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }
}
