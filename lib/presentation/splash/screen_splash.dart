import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/helper/sharedpreference.dart';
import 'package:news_app_api/presentation/dashbaord/dashboard.dart';
import 'package:news_app_api/presentation/login/screen_login.dart';

class SplashScrn extends StatefulWidget {
  const SplashScrn({super.key});

  @override
  State<SplashScrn> createState() => _SplashScrnState();
}

final SharedpreferenceClass sharedController = Get.put(SharedpreferenceClass());
bool issignedIn = false;
String email = '';

class _SplashScrnState extends State<SplashScrn> {
  @override
  void initState() {
    sharedController.getUserUIDInStatus();
    splashtime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/News-bro.png'),
            Text("NEWS SPOT",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: colorWhite,
                  fontSize: 38,
                ))
          ],
        ),
      ),
    );
  }

  void splashtime() async {
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        if (sharedController.uid.value.isEmpty) {
          Get.off(() => LoginScreen());
        } else {
          Get.off(() => const DashboardScrn());
        }
      },
    );
  }
}
