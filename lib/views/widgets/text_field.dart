import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.fieldType,
  });

  final TextEditingController controller;
  final String fieldType;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isValid = false;

  String? validator(String? value) {
    if (value != null && value.isNotEmpty) {
      setState(() {
        isValid = true;
      });
      return null;
    } else {
      setState(() {
        isValid = false;
      });
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.fieldType.contains("Password");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(
              widget.fieldType,
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: widget.controller,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isValid ? Colors.green : Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isValid ? Colors.green : Colors.blue,
                  width: 1.5,
                ),
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
              hintText: isPassword ? "************" : "example@example.com",
              suffix: isPassword
                  ? SizedBox(
                      width: 2.5.h,
                      height: 2.5.h,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility,
                            size: 2.5.h,
                          ), //TODO: Fix text field height when suffix is added
                        ),
                      ),
                    )
                  : null,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
            style: TextStyle(
              fontSize: 17.sp,
              color: isValid ? Colors.green : Colors.black,
            ),
            obscureText: isPassword,
            obscuringCharacter: "*",
            onChanged: validator,
          ),
        ],
      ),
    );
  }
}
