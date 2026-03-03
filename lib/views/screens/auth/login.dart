import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controllers/auth_provider.dart';
import 'package:restaurant/views/screens/auth/forgot_password.dart';
import 'package:restaurant/views/screens/auth/signup.dart';
import 'package:restaurant/views/widgets/media_login_button.dart';
import 'package:restaurant/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/views/widgets/title_of_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
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
                    key: authProvider.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TitleOfTextField(title: "Email", rightMargin: 69.w),
                        SizedBox(height: 1.h),
                        CustomTextFormField(
                          controller: authProvider.emailController,
                          hintText: "example@example.com",
                          validator: authProvider.emailValidator,
                          borderColor: authProvider.emailValid
                              ? Colors.green
                              : Colors.grey,
                        ),
                        SizedBox(height: 3.h),
                        TitleOfTextField(title: "Password", rightMargin: 60.w),
                        SizedBox(height: 1.h),
                        CustomTextFormField(
                          controller: authProvider.passwordController,
                          hintText: "Enter your password",
                          validator: authProvider.passwordValidator,
                          borderColor: authProvider.passwordValid
                              ? Colors.green
                              : Colors.grey,
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        SizedBox(height: 0.5.h),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Row(
                            children: [
                              Checkbox(
                                value: authProvider.rememberMe,
                                onChanged: authProvider.changeRememberMe,
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                splashRadius: 0,
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey,
                                ),
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
                          onPressed: authProvider.submitLoginForm,
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
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ),
                        SizedBox(height: 2.5.h),
                        RichText(
                          text: TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                authProvider.resetAllVariables();
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
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.w,
                                  ),
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
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    authProvider.resetAllVariables();
                                    Get.offAll(() => const SignupScreen());
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
        ),
      ),
    );
  }
}
