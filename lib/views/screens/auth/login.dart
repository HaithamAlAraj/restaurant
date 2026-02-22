import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/views/screens/auth/forgot_password.dart';
import 'package:restaurant/views/screens/main/home.dart';
import 'package:restaurant/views/screens/auth/signup.dart';
import 'package:restaurant/views/widgets/media_login_button.dart';
import 'package:restaurant/views/widgets/text_field.dart';
import 'package:restaurant/views/widgets/title_of_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _emailValid = false;
  bool _passwordValid = false;
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Get.snackbar(
        "Login Successful",
        "Welcome back, ${_emailController.text}!",
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                width: 22.w,
                height: 22.h,
              ),
              Text(
                "Sign in your account",
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 2.h),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TitleOfTextField(title: "Email", rightMargin: 69.w),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: "example@example.com",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _emailValid = false;
                          return "Please enter your email";
                        }
                        _emailValid = true;
                        return null;
                      },
                      borderColor: _emailValid ? Colors.green : Colors.grey,
                    ),
                    SizedBox(height: 3.h),
                    TitleOfTextField(title: "Password", rightMargin: 60.w),
                    SizedBox(height: 1.h),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: "Enter your password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          _passwordValid = false;
                          return "Please enter your password";
                        }
                        _passwordValid = true;
                        return null;
                      },
                      borderColor: _passwordValid ? Colors.green : Colors.grey,
                      suffixIcon: Icon(Icons.visibility),
                    ),
                    SizedBox(height: 0.5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w),
                      child: Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) => setState(() {
                              rememberMe = value ?? false;
                            }),
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            splashRadius: 0,
                            side: BorderSide(width: 0.5, color: Colors.grey),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ],
                      ),
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
                      child: Text("SIGN IN", style: TextStyle(fontSize: 17.sp)),
                    ),
                    SizedBox(height: 2.5.h),
                    RichText(
                      text: TextSpan(
                        text: "Forgot Password?",
                        style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => const ForgotPasswordScreen());
                          },
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.5.h),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(
                                "or continue with",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                      ),
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
                        text: "Don't have an account? ",
                        style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const SignupScreen());
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
