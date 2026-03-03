import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/services/auth_local_service.dart';
import 'package:restaurant/views/screens/auth/congrats.dart';
import 'package:restaurant/views/screens/auth/reset_password.dart';
import 'package:restaurant/views/screens/main/dashboard.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  final AuthLocalService authService = AuthLocalService();
  bool isLoggedIn = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool emailValid = false;
  bool passwordValid = false;
  bool confirmPasswordValid = false;
  bool rememberMe = false;
  final loginFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  final resetPasswordFormKey = GlobalKey<FormState>();
  int secondsRemaining = 60;
  Timer? timer;

  void startTimer() {
    secondsRemaining = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        secondsRemaining = 60;
      }
    });
  }

  void onSuccessfulOTP(String value) {
    timer?.cancel();
    Get.to(() => const ResetPasswordScreen());
  }

  void submitLoginForm() async {
    if (loginFormKey.currentState!.validate()) {
      await login("1");
      Get.snackbar(
        "Login Successful",
        "Welcome back, ${emailController.text}!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAll(() => const DashboardScreen());
    }
  }

  void submitSignupForm() async {
    if (signupFormKey.currentState!.validate()) {
      await login("1");
      Get.snackbar(
        "Login Successful",
        "Welcome back, ${emailController.text}!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAll(() => const DashboardScreen());
    }
  }

  void submitResetForm() {
    if (resetPasswordFormKey.currentState!.validate()) {
      Get.offAll(() => const CongratsScreen());
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      emailValid = false;
      return "Please enter your email";
    }
    emailValid = true;
    notifyListeners();
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      passwordValid = false;
      return "Please enter your password";
    }
    passwordValid = true;
    notifyListeners();
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      confirmPasswordValid = false;
      return "Please enter your password";
    }
    if (passwordController.text != confirmPasswordController.text) {
      confirmPasswordValid = false;
      return "Password does not match";
    }
    confirmPasswordValid = true;
    notifyListeners();
    return null;
  }

  void changeRememberMe(bool? value) {
    rememberMe = value ?? false;
    notifyListeners();
  }

  void resetAllVariables() {
    emailValid = false;
    passwordValid = false;
    confirmPasswordValid = false;
    rememberMe = false;
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> initialize() async {
    isLoggedIn = await authService.isLoggedIn();
    notifyListeners();
  }

  Future<void> login(String token) async {
    await authService.cacheToken(token);
    isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await authService.clearToken();
    isLoggedIn = false;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    timer?.cancel();
    super.dispose();
  }
}
