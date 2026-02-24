import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/views/screens/auth/congrats.dart';
import 'package:restaurant/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/views/widgets/title_of_text_field.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordValid = false;
  bool _confirmPasswordValid = false;
  bool rememberMe = false;
  final _formKey2 = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey2.currentState!.validate()) {
      Get.offAll(() => const CongratsScreen());
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            "Reset Password",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: _formKey2,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              SizedBox(height: 3.h),
              TitleOfTextField(title: "Password", rightMargin: 61.w),
              SizedBox(height: 1.h),
              CustomTextFormField(
                controller: _passwordController,
                hintText: "************",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _passwordValid = false;
                    return "Password cannot be empty";
                  }
                  _passwordValid = true;
                  return null;
                },
                borderColor: _passwordValid ? Colors.green : Colors.grey,
                suffixIcon: Icon(Icons.visibility_outlined, size: 18.sp),
              ),
              SizedBox(height: 3.h),
              TitleOfTextField(title: "Confirm Password", rightMargin: 46.w),
              SizedBox(height: 1.h),
              CustomTextFormField(
                controller: _confirmPasswordController,
                hintText: "************",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _confirmPasswordValid = false;
                    return "Password cannot be empty";
                  }
                  if (value != _passwordController.text) {
                    _confirmPasswordValid = false;
                    return "Passwords do not match";
                  }
                  _confirmPasswordValid = true;
                  return null;
                },
                borderColor: _confirmPasswordValid ? Colors.green : Colors.grey,
                suffixIcon: Icon(Icons.visibility_outlined, size: 18.sp),
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
                    Text("Remember me", style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: _submitForm,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    "SAVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
