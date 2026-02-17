import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePartTitle extends StatelessWidget {
  const HomePartTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }
}
