import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleOfTextField extends StatelessWidget {
  const TitleOfTextField({
    super.key,
    required this.title,
    required this.rightMargin,
  });

  final String title;
  final double rightMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: rightMargin),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 17.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
