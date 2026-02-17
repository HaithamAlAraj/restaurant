import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/views/screens/home.dart';
import 'package:restaurant/views/screens/login.dart';
import 'package:restaurant/views/widgets/media_login_button.dart';
import 'package:restaurant/views/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Get.snackbar(
        "Signup Successful",
        "Welcome, ${_emailController.text}!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(() => const HomeScreen());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 22.w,
                height: 22.h,
              ),
              Text(
                "Sign up your account",
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 2.h),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      fieldType: "Email",
                    ),
                    SizedBox(height: 3.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      fieldType: "Password",
                    ),
                    SizedBox(height: 3.h),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      fieldType: "Confirm Password",
                    ),
                    SizedBox(height: 1.h),
                    TextButton(
                      onPressed: _submitForm,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 36.w,
                          vertical: 1.5.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.w),
                        ),
                      ),
                      child: Text("NEXT", style: TextStyle(fontSize: 17.sp)),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediaLoginButton(
                          imagePath: 'assets/images/facebook_logo.png',
                          text: "Facebook",
                          onTap: () {},
                        ),
                        SizedBox(width: 4.w),
                        MediaLoginButton(
                          imagePath: 'assets/images/google_logo.png',
                          text: "Google",
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5.h),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Sign in",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const LoginScreen());
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
