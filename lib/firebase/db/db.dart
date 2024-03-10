import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseClass {
  final String uid;
  DataBaseClass({required this.uid});
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');
  Future saveUserdata(
      {required String phoneNumber, required String email}) async {
    usercollection
        .doc(uid)
        .set({'email': email, 'phoneNumber': phoneNumber, 'uid': uid});
  }

  Future<QuerySnapshot?> gettingUserData() async {
    QuerySnapshot snapshot =
        await usercollection.where("uid", isEqualTo: uid).get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot;
    } else {
      return null;
    }
  }
}
