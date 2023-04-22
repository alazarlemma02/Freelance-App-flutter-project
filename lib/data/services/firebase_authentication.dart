import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/model/user_model.dart';
import 'package:sira/data/services/firebase_api_services.dart';

class FireAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUsingEmailPassword(
      {required String? fullName,
      required String? email,
      required String? phoneNumber,
      required String? password,
      required String? userType,
      required BuildContext context}) async {
    String result = 'some error ocurred';

    try {
      if (email!.isNotEmpty || fullName!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password!,
        );

        UserModel newUser = UserModel(
            email: email,
            fullName: fullName ?? '',
            password: password,
            phoneNumber: phoneNumber ?? '',
            userId: user.user!.uid,
            userType: userType);

        result = 'true';
        await _firestore.collection('users').doc(email).set(
              newUser.toJson(),
            );
      }
    } catch (err) {
      result = 'false';
    }
    return result;
  }

  Future<String> signInUsingEmialPassword({
    required String email,
    required String password,
  }) async {
    FirebaseApiServices firebaseApiServices = FirebaseApiServices();
    String result = 'Some error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'true';
        // firebaseApiServices.initUserType();
      }
    } catch (err) {
      result = err.toString();
    }

    return result;
  }

  Future<String?> checkUserTypeWhileSignin({
    required String email,
    required String password,
  }) async {
    FirebaseApiServices firebaseApiServices = FirebaseApiServices();

    String? type;
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(email)
            .get();
        type = userDoc.get('userType').toString();
      }
    } catch (err) {
      type = err.toString();
    }

    return type;
  }
}
