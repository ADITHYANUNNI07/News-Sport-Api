import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/firebase/auth/auth.dart';
import 'package:news_app_api/getx/snackBar/snackbar.dart';
import 'package:news_app_api/presentation/login/screen_login.dart';

ValueNotifier<bool?> phoneNoValueNoti = ValueNotifier(null);
GetxSnackBarControllerClass snackBarConroller =
    Get.put(GetxSnackBarControllerClass());
void phoneNumberValidatorFN(String phoneNumber) {
  if (phoneNumber.trim().length == 10 && isNumeric(phoneNumber)) {
    phoneNoValueNoti.value = true;
  } else if (phoneNumber.isEmpty) {
    phoneNoValueNoti.value = null;
  } else {
    phoneNoValueNoti.value = false;
  }
}

bool isNumeric(String str) {
  return num.tryParse(str) != null;
}

void loginFun(
    {required String phoneNumber, required bool isOTP, String oTPCode = ''}) {
  if (phoneNoValueNoti.value == true) {
    isOTP
        ? oTPCode.length == 6
            ? AuthServiceClass().otpverify(oTPCode)
            : snackBarConroller.showSnackBar(
                title: 'OTP Code',
                content: 'Please Enter the valid OTP Code',
                errorcolor: colorRed)
        : AuthServiceClass().phoneNumberAuth(phoneNumber);
  } else if (phoneNoValueNoti.value == false) {
    snackBarConroller.showSnackBar(
        title: 'Incorrect Phone Number',
        content: 'Please Enter the valid Phone Number',
        errorcolor: colorRed);
  } else {
    snackBarConroller.showSnackBar(
        title: 'Phone Number is Empty',
        content: 'Please Enter the Phone Number',
        errorcolor: colorRed);
  }
}
