import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.onTap,
  });
  final String categoryName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 22.w,
        height: 18.h,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[100],
          borderRadius: BorderRadius.circular(50.sp),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.5.h),
              child: CircleAvatar(
                radius: 10.w,
                backgroundImage: AssetImage(
                  "assets/images/${categoryName.toLowerCase()}.jpg",
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              categoryName,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
