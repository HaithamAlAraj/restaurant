import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MediaLoginButton extends StatelessWidget {
  const MediaLoginButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  final String imagePath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: Colors.grey[300]!),
        ),
        width: 32.w,
        height: 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagePath), width: 4.w, height: 4.w),
            SizedBox(width: 2.w),
            Text(text, style: TextStyle(fontSize: 15.sp)),
          ],
        ),
      ),
    );
  }
}
