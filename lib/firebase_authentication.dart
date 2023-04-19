import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sira/constants/colors.dart';
import 'package:sira/data/model/user_model.dart';

class FireAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerUsingEmailPassword(
      {required String? fullName,
      required String? email,
      required String? phoneNumber,
      required String? password,
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
        );

        result = 'true';
        await _firestore.collection('users').doc(phoneNumber).set(
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
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'true';
      }
    } catch (err) {
      
      result = err.toString();
    }
    return result;
  }
}
