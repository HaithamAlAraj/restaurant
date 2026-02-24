import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/views/screens/auth/reset_password.dart';
import 'package:restaurant/views/widgets/otp_field.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _secondsRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 60;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void onCompleted(String value) {
    _timer?.cancel();
    Get.to(() => const ResetPasswordScreen());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(2.w),
          child: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              padding: EdgeInsets.all(2.w),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 3,
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined, size: 3.5.w),
          ),
        ),
        title: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 100.w,
            height: 80.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Code has been sent to +6282******39",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 3.h),
                OtpField(onCompleted: onCompleted),
                SizedBox(height: 3.h),
                RichText(
                  text: TextSpan(
                    text: "Resend OTP in ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: _secondsRemaining.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " s",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
