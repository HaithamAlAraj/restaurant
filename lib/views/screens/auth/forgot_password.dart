import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot Password Screen"),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
