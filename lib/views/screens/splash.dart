import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controllers/auth_provider.dart';
import 'package:restaurant/views/screens/introduction.dart';
import 'package:restaurant/views/screens/main/dashboard.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final authProvider = context.read<AuthProvider>();
    await authProvider.initialize();

    Get.offAll(
      () => authProvider.isLoggedIn
          ? const DashboardScreen()
          : const IntroductionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 40.w,
          height: 40.h,
        ),
      ),
    );
  }
}
