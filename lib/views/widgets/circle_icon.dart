import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key, required this.color, required this.icon});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withAlpha(50),
      ),
      child: Icon(icon, color: color, size: 5.w),
    );
  }
}
