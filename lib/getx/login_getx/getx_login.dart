import 'package:get/get.dart';

class LoginScrnGetxControllerClass extends GetxController {
  var isOtp = false.obs;
  var isLoading = false.obs;
  void isOTPAllowFN({bool isOtpvalue = true}) {
    isOtp.value = isOtpvalue;
  }

  void isLoadingFN({bool isLoad = true}) {
    isLoading.value = isLoad;
  }
}
