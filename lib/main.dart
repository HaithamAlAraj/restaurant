import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/controllers/auth_provider.dart';
import 'package:restaurant/controllers/dashboard_provider.dart';
import 'package:restaurant/views/screens/splash.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: Theme.of(
            context,
          ).copyWith(scaffoldBackgroundColor: Colors.white),
        );
      },
    );
  }
}
