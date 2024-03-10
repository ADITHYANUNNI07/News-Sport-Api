import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_app_api/core/color/colors.dart';
import 'package:news_app_api/firebase/db/db.dart';
import 'package:news_app_api/getx/snackBar/snackbar.dart';
import 'package:news_app_api/helper/sharedpreference.dart';
import 'package:news_app_api/presentation/dashbaord/dashboard.dart';
import 'package:news_app_api/presentation/login/screen_login.dart';

String verificationID = '';

class AuthServiceClass {
  final GetxSnackBarControllerClass controller =
      Get.put(GetxSnackBarControllerClass());

  final SharedpreferenceClass sharedController =
      Get.put(SharedpreferenceClass());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future phoneNumberAuth(String phoneNumber) async {
    loginScrnGetxController.isLoadingFN(isLoad: true);
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (phoneAuthCredential) async {
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loginScrnGetxController.isLoadingFN(isLoad: false);
        controller.showSnackBar(
            title: 'Phone Number Signin Failed',
            content: e.toString(),
            errorcolor: colorRed);
      },
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
        loginScrnGetxController.isLoadingFN(isLoad: false);
        loginScrnGetxController.isOTPAllowFN(isOtpvalue: true);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future otpverify(String oTPCode) async {
    loginScrnGetxController.isLoadingFN(isLoad: true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: oTPCode);
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        QuerySnapshot? snapshot =
            await DataBaseClass(uid: user.uid).gettingUserData();
        log('${user.email}::${user.phoneNumber}');
        if (snapshot == null) {
          await DataBaseClass(uid: user.uid).saveUserdata(
              phoneNumber: user.phoneNumber!, email: user.email ?? '');
          sharedController.saveUserUIDStatus(user.uid);
          Get.offAll(() => const DashboardScrn());
          loginScrnGetxController.isLoadingFN(isLoad: false);
        } else {
          sharedController.saveUserUIDStatus(user.uid);
          loginScrnGetxController.isLoadingFN(isLoad: false);
          Get.offAll(() => const DashboardScrn());
        }
      }
    } catch (e) {
      loginScrnGetxController.isLoadingFN(isLoad: false);
      controller.showSnackBar(
          title: 'OTP is Incorrect',
          content: e.toString(),
          errorcolor: colorRed);
    }
  }

  Future signInWithGoogle() async {
    loginScrnGetxController.isLoadingFN(isLoad: true);
    try {
      final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
      if (guser != null) {
        final GoogleSignInAuthentication gauth = await guser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gauth.accessToken, idToken: gauth.idToken);
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;
        if (user != null) {
          QuerySnapshot? snapshot =
              await DataBaseClass(uid: user.uid).gettingUserData();
          if (snapshot == null) {
            await DataBaseClass(uid: user.uid).saveUserdata(
                email: user.email ?? '', phoneNumber: user.phoneNumber ?? '');
            sharedController.saveUserUIDStatus(user.uid);
            Get.offAll(() => const DashboardScrn());
            loginScrnGetxController.isLoadingFN(isLoad: false);
          } else {
            sharedController.saveUserUIDStatus(user.uid);
            Get.offAll(() => const DashboardScrn());
            loginScrnGetxController.isLoadingFN(isLoad: false);
          }
        }
      } else {
        loginScrnGetxController.isLoadingFN(isLoad: false);
        return;
      }
    } catch (e) {
      loginScrnGetxController.isLoadingFN(isLoad: false);
      controller.showSnackBar(
          title: 'Google Sign-in', content: e.toString(), errorcolor: colorRed);
    }
  }
}
