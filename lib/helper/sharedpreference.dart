import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceClass extends GetxController {
  String userUIDKey = "USERUIDINKEY";
  RxString uid = ''.obs;
  Future<bool> saveUserUIDStatus(String uid) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userUIDKey, uid);
  }

  Future getUserUIDInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final value = sf.getString(userUIDKey);
    uid.value = value ?? '';
  }
}
