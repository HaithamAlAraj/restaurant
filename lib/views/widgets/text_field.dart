import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
    required this.borderColor,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.h),
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(4.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(4.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(4.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(4.w),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              hintStyle: TextStyle(fontSize: 17.sp, color: Colors.grey[600]),
              hintText: hintText,
              suffixIcon: suffixIcon,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
            style: TextStyle(fontSize: 17.sp, color: borderColor),
            obscureText: suffixIcon != null,
            obscuringCharacter: "*",
            onChanged: validator,
          ),
        ],
      ),
    );
  }
}
