import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/presentation/splash/screen_splash.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customPrimaryColor,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFF773BFF),
        iconTheme: const IconThemeData(color: Color(0xFF773BFF)),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Color(0xFF773BFF),
        ),
        textTheme: GoogleFonts.poppinsTextTheme()
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: const SplashScrn(),
    );
  }
}
