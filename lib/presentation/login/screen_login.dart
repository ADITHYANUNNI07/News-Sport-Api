// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_api/core/constants/constants.dart';
import 'package:news_app_api/core/widgets/widget.dart';
import 'package:news_app_api/getx/login_getx/getx_login.dart';
import 'package:news_app_api/presentation/login/function/login_function.dart';
import 'package:news_app_api/firebase/auth/auth.dart';

final LoginScrnGetxControllerClass loginScrnGetxController =
    Get.put(LoginScrnGetxControllerClass());

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController numberController = TextEditingController();
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorApp,
      child: SafeArea(child: Scaffold(
        body: Obx(() {
          if (loginScrnGetxController.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: ValueListenableBuilder(
                valueListenable: phoneNoValueNoti,
                builder: (emailcontext, isemail, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LottieBuilder.asset('assets/animations/welcome.json'),
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back.',
                            style: GoogleFonts.oswald(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          sizedBox10H,
                          const Text(
                            'Write, and read millions of articles from various countries, and win several competitions',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                          sizedBox10H,
                          TextFormWidget(
                            controller: numberController,
                            keyboardType: TextInputType.phone,
                            label: 'Phone No.',
                            icon: Icons.phone,
                            suffixIconColor:
                                isemail == true ? colorGreen : colorRed,
                            suffixicon: isemail == null
                                ? null
                                : isemail == true
                                    ? Icons.check_circle
                                    : Icons.cancel,
                            onChanged: (value) {
                              phoneNumberValidatorFN(numberController.text);
                            },
                          ),
                          sizedBox5H,
                          Visibility(
                            visible: loginScrnGetxController.isOtp.value,
                            child: OtpTextField(
                              numberOfFields: 6,
                              fieldWidth: (Get.width - 108) / 6,
                              showFieldAsBox: true,
                              onSubmit: (String verificationCode) {
                                otpCode = verificationCode;
                              },
                            ),
                          ),
                          sizedBox5H,
                          SizedBox(
                            width: Get.width,
                            child: ElevatedBtnWidget(
                                onPressed: () {
                                  loginFun(
                                      phoneNumber: numberController.text,
                                      isOTP:
                                          loginScrnGetxController.isOtp.value,
                                      oTPCode: otpCode);
                                  // Get.to(() => const DashboardScrn());
                                },
                                title: !loginScrnGetxController.isOtp.value
                                    ? 'Get OTP'
                                    : 'Verify',
                                btnColor: colorApp),
                          ),
                          sizedBox10H,
                          const Align(child: Text('OR')),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedBtnWidget(
                              onPressed: () async {
                                AuthServiceClass().signInWithGoogle();
                              },
                              title: 'Sign-in with Google',
                              borderColor: colorWhite,
                              leading: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/Google-Icon.png',
                                    width: 20,
                                  ),
                                  sizedBox5W
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }),
      )),
    );
  }
}
