import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/data/services/firebase_authentication.dart';

class FirebaseApiServices {
  String? userType;
  void setUserType(String? user) {
    userType = user;
  }

  void initUserType() async {
    try {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setUserType(userDoc.get('userType').toString());
    } catch (e) {
      print(e.toString());
    }
  }

  String? getUserType() {
    return userType;
  }
}
